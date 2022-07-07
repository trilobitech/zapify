import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zapfy/app/home/chatapp_launcher/chatapp_launcher.dart';
import 'package:zapfy/app/home/models/region.dart';

class AppLauncherWidget extends StatelessWidget {
  const AppLauncherWidget({
    Key? key,
    required this.region,
    required this.valueListenable,
    required this.chatAppLaunchers,
  }) : super(key: key);

  final Region? region;
  final ValueListenable<TextEditingValue> valueListenable;
  final List<IChatAppLauncher> chatAppLaunchers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Row(
        children: chatAppLaunchers.map(
          (chatAppLauncher) {
            final info = chatAppLauncher.info();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ActionChip(
                avatar: Icon(info.icon, color: Colors.white),
                label: Text(info.label),
                labelStyle: const TextStyle(color: Colors.white),
                backgroundColor: info.brandColor,
                onPressed: () {
                  openChatApp(chatAppLauncher);
                },
              ),
            );
          },
        ).toList(growable: false),
      ),
    );
  }

  openChatApp(IChatAppLauncher chatAppLauncher) async {
    final phoneNumber =
        '+${region!.prefix}${valueListenable.value.text.replaceAll(RegExp(r'\D'), '')}';

    chatAppLauncher.launch(phoneNumber).then((value) {
      // TODO: save on history
    }).onError((error, stackTrace) {
      // TODO: log error
    });
  }
}
