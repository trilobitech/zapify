import 'dart:async';

import 'package:analytics_core/analytics_core.dart';
import 'package:config/config.dart';
import 'package:ext/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:logify/logify.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/history.dart';
import '../domain/usecase/get_phone_number_history.dart';
import '../domain/usecase/remove_phone_number_history.dart';
import '../domain/usecase/restore_phone_number_history.dart';
import 'history_state.dart';

class HistoryBloc extends StateActionBloc<HistoryState, HistoryAction> {
  HistoryBloc({
    required GetPhoneNumberHistoryUseCase getPhoneNumberHistory,
    required RemovePhoneNumberHistoryUseCase removePhoneNumberHistory,
    required RestorePhoneNumberHistoryUseCase restorePhoneNumberHistory,
    required IAnalytics analytics,
  })  : _getPhoneNumberHistory = getPhoneNumberHistory,
        _removePhoneNumberHistory = removePhoneNumberHistory,
        _restorePhoneNumberHistory = restorePhoneNumberHistory,
        _analytics = analytics,
        super(HistoryState(entries: []));

  final GetPhoneNumberHistoryUseCase _getPhoneNumberHistory;
  final RemovePhoneNumberHistoryUseCase _removePhoneNumberHistory;
  final RestorePhoneNumberHistoryUseCase _restorePhoneNumberHistory;
  final IAnalytics _analytics;

  Offset _currentTapPosition = Offset.zero;

  @override
  @protected
  Future<void> load() async {
    final historicSize = await _historicSize();

    final initialState = historicSize > 0
        ? HistoryState.loading(historicSize)
        : HistoryState.empty();

    setState(initialState);

    setStateFrom(
      _getPhoneNumberHistory().asyncMap(_mapToState),
    );
  }

  void select(HistoryEntry entry) {
    _analytics.itemSelected('phone_from_history');
    sendAction(HistoryAction.select(entry));
  }

  void tapPositionFrom(TapDownDetails details) {
    _currentTapPosition = details.globalPosition;
  }

  void longPress(HistoryEntry entry) {
    _analytics.itemLongPressed('phone_from_history');
    sendAction(
      HistoryAction.showMenu(
        entry,
        _currentTapPosition,
        ContextMenuAction.values,
      ),
    );
  }

  Future<void> selectOption(
    HistoryEntry entry,
    ContextMenuAction? action,
  ) async {
    switch (action) {
      case ContextMenuAction.remove:
        await remove(entry);
        break;
      case null:
        // do nothing
        break;
    }
  }

  Future<void> remove(HistoryEntry entry) async {
    _analytics.itemRemoved('phone_from_history');
    await _removePhoneNumberHistory(entry).catchError(catchErrorLogger);
    sendAction(HistoryAction.showRestoreEntrySnackBar(entry));
  }

  Future<void> restore(HistoryEntry entry) async {
    _analytics.buttonPressed('restore_phone_from_history');
    await _restorePhoneNumberHistory(entry).catchError(catchErrorLogger);
  }

  Future<HistoryState> _mapToState(List<HistoryEntry> entries) async {
    final isCallLogTabEnabled =
        await RemoteConfig.isCallLogTabEnabled.get<bool>();
    return entries.isNotEmpty
        ? HistoryState(
            entries: entries,
            isDismissable: !isCallLogTabEnabled,
          )
        : HistoryState.empty();
  }

  Future<int> _historicSize() async {
    try {
      return await LocalConfig.historicSize.get();
    } catch (e, stack) {
      Log.e(e, stack);
      return 0;
    }
  }
}
