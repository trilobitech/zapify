import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/history.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState implements IState {
  factory HistoryState.loading(int size) = _HistoryStateLoading;
  factory HistoryState.empty() = _HistoryStateEmpty;
  factory HistoryState({required List<HistoryEntry> entries, @Default(false) bool isDismissable}) =
      _HistoryStatePopulated;
}

@freezed
class HistoryAction with _$HistoryAction implements IAction {
  factory HistoryAction.select(HistoryEntry entry) = _HistoryActionEntrySelect;

  factory HistoryAction.showMenu(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) =
      _HistoryActionShowMenu;

  factory HistoryAction.showRestoreEntrySnackBar(HistoryEntry entry) = _HistoryActionEntryRemoved;
}

enum ContextMenuAction { remove }
