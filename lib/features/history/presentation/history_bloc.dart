import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';

import '../../../common/arch/bloc_controller.dart';
import '../../../config/local_config.dart';
import '../domain/entity/history.dart';
import '../domain/usecase/get_phone_number_history.dart';
import '../domain/usecase/remove_phone_number_history.dart';
import '../domain/usecase/restore_phone_number_history.dart';
import 'history_state.dart';

class HistoryBloc extends BlocController<HistoryEvent, HistoryState> {
  HistoryBloc({
    required GetPhoneNumberHistoryUseCase getPhoneNumberHistory,
    required RemovePhoneNumberHistoryUseCase removePhoneNumberHistory,
    required RestorePhoneNumberHistoryUseCase restorePhoneNumberHistory,
  })  : _getPhoneNumberHistory = getPhoneNumberHistory,
        _removePhoneNumberHistory = removePhoneNumberHistory,
        _restorePhoneNumberHistory = restorePhoneNumberHistory,
        super(HistoryState(entries: []));

  final GetPhoneNumberHistoryUseCase _getPhoneNumberHistory;
  final RemovePhoneNumberHistoryUseCase _removePhoneNumberHistory;
  final RestorePhoneNumberHistoryUseCase _restorePhoneNumberHistory;

  @override
  @protected
  Future<void> load() async {
    final int historicSize = await _historicSize();

    final initialState = historicSize > 0
        ? HistoryState.loading(historicSize)
        : HistoryState.empty();

    emit(initialState);

    subscriptions.add(
      _getPhoneNumberHistory().map(_stateFor).listen(emit),
    );
  }

  void select(HistoryEntry entry) {
    analytics.itemSelected('phone_from_history');
    add(HistoryEvent.select(entry));
  }

  void longPress(HistoryEntry entry) {
    analytics.itemLongPressed('phone_from_history');
    add(HistoryEvent.select(entry));
  }

  Future<void> remove(HistoryEntry entry) async {
    analytics.itemRemoved('phone_from_history');
    await (_removePhoneNumberHistory(entry).catchError(catchErrorLogger));
    add(HistoryEvent.showRestoreEntrySnackBar(entry));
  }

  Future<void> restore(HistoryEntry entry) async {
    analytics.buttonPressed('restore_phone_from_history');
    await (_restorePhoneNumberHistory(entry).catchError(catchErrorLogger));
  }

  HistoryState _stateFor(List<HistoryEntry> entries) {
    return entries.isNotEmpty
        ? HistoryState(entries: entries)
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
