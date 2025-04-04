import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logify/logify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../common/ext/context.dart';
import '../../../../chat_app/domain/entity/chat_app.dart';

class ChatAppNotFoundDialog extends StatelessWidget {
  const ChatAppNotFoundDialog(this.app, {super.key});

  final ChatApp app;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.strings.homeChatAppNotFoundErrorTitle),
      content: Text(context.strings.homeChatAppNotFoundErrorMessage(app.name)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(context.strings.homeChatAppNotFoundErrorSecondaryAction),
        ),
        TextButton(
          onPressed: () {
            _openStore(app);
            Navigator.of(context).pop();
          },
          child: Text(context.strings.homeChatAppNotFoundErrorSecondaryAction),
        ),
      ],
    );
  }

  void _openStore(ChatApp app) async {
    try {
      await launchUrl(
        app.storeUri,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } catch (e, stackTrace) {
      Log.e(e, stackTrace);
    }
  }
}

extension _ChatAppExt on ChatApp {
  Uri get storeUri => Platform.isIOS ? appStoreUrl : playStoreUrl;

  Uri get playStoreUrl =>
      Uri.parse('https://play.google.com/store/search?q=$name&c=apps');

  Uri get appStoreUrl => Uri.parse('https://www.apple.com/search/$name');
}
