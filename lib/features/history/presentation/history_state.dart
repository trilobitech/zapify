import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zapfy/features/shared/domain/entity/history_entry.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryViewState with _$HistoryViewState {
  factory HistoryViewState.loading(int size) = _HistoryViewStateLoading;
  factory HistoryViewState.empty() = _HistoryViewStateEmpty;
  factory HistoryViewState({
    required List<HistoryEntry> entries,
  }) = _HistoryViewStatePopulated;
}
