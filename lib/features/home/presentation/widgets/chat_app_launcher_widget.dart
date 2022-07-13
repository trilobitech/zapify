import 'package:flutter/material.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';

class ChatAppLauncherWidget extends StatelessWidget {
  const ChatAppLauncherWidget({
    Key? key,
    required this.chatApps,
    required this.onChatAppPressed,
  }) : super(key: key);

  final List<ChatApp> chatApps;
  final Function(ChatApp) onChatAppPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Row(
        children: chatApps.map(_buildChatAppLauncher).toList(growable: false),
      ),
    );
  }

  Widget _buildChatAppLauncher(ChatApp chatApp) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ActionChip(
        avatar: Icon(chatApp.icon, color: Colors.white),
        label: Text('Open with ${chatApp.name}'),
        labelStyle: const TextStyle(color: Colors.white),
        backgroundColor: chatApp.brandColor,
        onPressed: () {
          onChatAppPressed(chatApp);
        },
      ),
    );
  }
}
