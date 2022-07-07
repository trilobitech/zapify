import 'package:flutter/material.dart';
import 'package:zapfy/app/home/chatapp_launcher/chatapp_launcher.dart';
import 'package:zapfy/app/home/models/app_info.dart';

class WhatsAppLauncher extends AbstractChatAppLauncher {
  @override
  String buildAppDeeplink(String phoneNumber) => 'https://wa.me/$phoneNumber';

  @override
  AppInfo info() {
    return const AppInfo(
      icon: Icons.whatsapp,
      label: 'Open with WhatsApp',
      brandColor: Color(0xFF25d366),
    );
  }
}
