import 'package:flutter/material.dart';
import 'package:zapfy/app/home/chatapp_launcher/chatapp_launcher.dart';
import 'package:zapfy/app/home/models/app_info.dart';

class TelegramLauncher extends AbstractChatAppLauncher {
  @override
  String buildAppDeeplink(String phoneNumber) => 'https://t.me/$phoneNumber';

  @override
  AppInfo info() {
    return const AppInfo(
      icon: Icons.telegram,
      label: 'Open with Telegram',
      brandColor: Color(0xFF0088CC),
    );
  }
}
