import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/domain/entity/history_entry.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  factory HistoryState.loading(int size) = _HistoryStateLoading;
  factory HistoryState.empty() = _HistoryStateEmpty;
  factory HistoryState({
    required List<HistoryEntry> entries,
  }) = _HistoryStatePopulated;
}

@freezed
class HistoryEvent with _$HistoryEvent {
  factory HistoryEvent.select(HistoryEntry entry) =
      _HistoryEventEntrySelect;

  factory HistoryEvent.showRestoreEntrySnackBar(HistoryEntry entry) =
      _HistoryEventEntryRemoved;
}
