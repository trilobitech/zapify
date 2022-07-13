import 'package:flutter/material.dart';

class ChatApp {
  ChatApp({
    required this.icon,
    required this.name,
    required this.brandColor,
    required this.deepLinkPrefix,
  });

  IconData icon;
  String name;
  Color brandColor;
  String deepLinkPrefix;
}
