import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/history.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState implements IState {
  factory HistoryState.loading(int size) = LoadingHistoryState;

  factory HistoryState.empty() = EmptyHistoryState;

  factory HistoryState({required List<HistoryEntry> entries, @Default(false) bool isDismissible}) = LoadedHistoryState;
}

@freezed
sealed class HistoryAction with _$HistoryAction implements IAction {
  factory HistoryAction.select(HistoryEntry entry) = SelectEntryHistoryAction;

  factory HistoryAction.showMenu(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) =
      ShowMenuHistoryAction;

  factory HistoryAction.showRestoreEntrySnackBar(HistoryEntry entry) = AskToRestoreEntryHistoryAction;
}

enum ContextMenuAction { remove }
