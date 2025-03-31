import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/history.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState implements IState {
  factory HistoryState.loading(int size) = LoadingHistoryState;

  factory HistoryState.empty() = EmptyHistoryState;

  factory HistoryState({
    required List<HistoryEntry> entries,
    AdOptions? adOptions,
    @Default(false) bool isDismissible,
  }) = LoadedHistoryState;
}

@freezed
sealed class HistoryAction with _$HistoryAction implements IAction {
  factory HistoryAction.select(HistoryEntry entry) = SelectEntryHistoryAction;

  factory HistoryAction.showMenu(
    HistoryEntry entry,
    Offset position,
    Iterable<ContextMenuAction> options,
  ) = ShowMenuHistoryAction;

  factory HistoryAction.showRestoreEntrySnackBar(HistoryEntry entry) =
      AskToRestoreEntryHistoryAction;
}

enum ContextMenuAction { remove }

class AdOptions {
  const AdOptions({required this.unitId, required this.interval});

  final String unitId;
  final int interval;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdOptions &&
        other.unitId == unitId &&
        other.interval == interval;
  }

  @override
  int get hashCode => unitId.hashCode ^ interval.hashCode;

  @override
  String toString() => 'AdOptions(unitId: $unitId, interval: $interval)';
}
