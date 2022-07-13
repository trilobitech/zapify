import 'package:flutter/material.dart';

class HistoryEntry {
  HistoryEntry({
    required this.phoneNumber,
    required this.at,
  });

  String phoneNumber;
  DateTime at;

  @override
  int get hashCode => phoneNumber.hashCode;

  @override
  bool operator ==(Object other) {
    return super == other ||
        (other is HistoryEntry && other.phoneNumber == phoneNumber);
  }
}
