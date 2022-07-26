import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:zapify/core/ext/context.dart';
import 'package:zapify/core/widgets/image_resolver_widget.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';

class ChatAppsWidget extends StatelessWidget {
  const ChatAppsWidget({
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
            .mapIndexed(
              (index, chatApp) => _ChatAppLauncherWidget(
                position: index,
                chatApp: chatApp,
                onChatAppPressed: onChatAppPressed,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _ChatAppLauncherWidget extends StatefulWidget {
  const _ChatAppLauncherWidget({
    Key? key,
    required this.position,
    required this.chatApp,
    required this.onChatAppPressed,
  }) : super(key: key);

  final int position;
  final ChatApp chatApp;
  final Function(ChatApp) onChatAppPressed;

  @override
  State<StatefulWidget> createState() => _ChatAppLauncherWidgetState();
}

class _ChatAppLauncherWidgetState extends State<_ChatAppLauncherWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.position * 200 + 150),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatApp = widget.chatApp;
    return Padding(
      key: ValueKey(chatApp.name),
      padding: const EdgeInsets.only(right: 8),
      child: ScaleTransition(
        scale: _animation,
        child: ActionChip(
          avatar: ImageResolverWidget.icon(
            uri: chatApp.icon,
            color: Colors.white,
          ),
          label: Text(
            context.strings.homeOpenWithButton.format([chatApp.name]),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Color(chatApp.brandColor.value),
          onPressed: () {
            widget.onChatAppPressed(chatApp);
          },
        ),
      ),
    );
  }
}
