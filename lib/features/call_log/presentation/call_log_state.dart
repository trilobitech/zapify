import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/call.dart';

part 'call_log_state.freezed.dart';

@freezed
sealed class CallLogState with _$CallLogState implements IState {
  factory CallLogState({required Iterable<CallEntry> entries}) =
      LoadedCallLogState;

  factory CallLogState.empty() = EmptyCallLogState;

  factory CallLogState.error(dynamic error) = ErrorCallLogState;

  factory CallLogState.loading(int itemCount) = LoadingCallLogState;
}

@freezed
sealed class CallLogAction with _$CallLogAction implements IAction {
  factory CallLogAction.select(CallEntry entry) = SelectEntryCallLogAction;
}

class CallEntry {
  CallEntry({
    required this.leading,
    required this.title,
    this.subtitle,
    required this.date,
    required this.phoneNumber,
  });

  factory CallEntry.from(CallEntity item) => CallEntry(
    leading: item.type.leading,
    title: item.name ?? item.number,
    date: item.date,
    phoneNumber: item.number,
  );

  final Leading leading;
  final String title;
  final String? subtitle;
  final DateTime date;
  final String phoneNumber;
}

class Leading {
  Leading({required this.icon, this.color});

  final IconData icon;
  final Color? color;
}

extension _CallTypeExt on CallType {
  Leading get leading => Leading(icon: _icon, color: _color);

  IconData get _icon {
    switch (this) {
      case CallType.income:
        return Icons.call_received;
      case CallType.outcome:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_missed;
      case CallType.rejected:
        return Icons.call_missed_outgoing;
      case CallType.blocked:
        return Icons.block;
    }
  }

  Color? get _color {
    switch (this) {
      case CallType.missed:
      case CallType.rejected:
      case CallType.blocked:
        return Colors.red;
      default:
        return Colors.teal;
    }
  }
}
