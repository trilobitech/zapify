import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entity/call.dart';

part 'call_log_state.freezed.dart';

@freezed
class CallLogState with _$CallLogState {
  factory CallLogState({
    required Iterable<CallItem> entries,
  }) = _CallLogStatePopulated;

  factory CallLogState.empty() = _CallLogStateEmpty;

  factory CallLogState.error(dynamic error) = _CallLogStateError;

  factory CallLogState.loading(int itemCount) = _CallLogStateLoading;
}

class CallItem {
  CallItem({
    required this.leading,
    required this.title,
    this.subtitle,
    required this.date,
    required this.number,
  });

  factory CallItem.from(CallEntity item) => CallItem(
        leading: item.type.leading,
        title: item.name ?? item.number,
        date: item.date,
        number: item.number,
      );

  final Leading leading;
  final String title;
  final String? subtitle;
  final DateTime date;
  final String number;
}

class Leading {
  Leading({
    required this.icon,
    this.color,
  });

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
        return null;
    }
  }
}
