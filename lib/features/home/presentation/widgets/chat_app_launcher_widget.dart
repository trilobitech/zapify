import 'package:flutter/material.dart';
import 'package:zapfy/core/ext/context.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/core/widgets/image_resolver_widget.dart';

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
      padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
      child: Row(
        children: chatApps
            .map(
              (chatApp) => _buildChatAppLauncher(context, chatApp),
            )
            .toList(growable: false),
      ),
    );
  }

  Widget _buildChatAppLauncher(BuildContext context, ChatApp chatApp) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(
        avatar: ImageResolverWidget(
          uri: chatApp.icon,
          color: Colors.white,
        ),
        label: Text(
          context.strings.homeOpenWithButton.format([chatApp.name]),
        ),
        labelStyle: const TextStyle(color: Colors.white),
        backgroundColor: Color(chatApp.brandColor),
        onPressed: () {
          onChatAppPressed(chatApp);
        },
      ),
    );
  }
}
