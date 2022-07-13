import 'package:flutter/material.dart';

class HistoryEntry {
  HistoryEntry({
    required this.appIcon,
    required this.phoneNumber,
    required this.at,
  });

  IconData appIcon;
  String phoneNumber;
  DateTime at;
}
