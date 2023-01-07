import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/arch/bloc_state.dart';
import '../domain/entity/history.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState implements IState {
  factory HistoryState.loading(int size) = _HistoryStateLoading;
  factory HistoryState.empty() = _HistoryStateEmpty;
  factory HistoryState({
    required List<HistoryEntry> entries,
  }) = _HistoryStatePopulated;
}

@freezed
class HistoryAction with _$HistoryAction implements IAction {
  factory HistoryAction.select(HistoryEntry entry) = _HistoryActionEntrySelect;

  factory HistoryAction.showRestoreEntrySnackBar(HistoryEntry entry) =
      _HistoryActionEntryRemoved;
}
