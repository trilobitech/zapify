import 'package:zapfy/features/home/domain/entity/icon.dart';

class ChatApp {
  ChatApp({
    required this.icon,
    required this.name,
    required this.brandColor,
    required this.deepLinkPrefix,
    this.requirePreVerification = false,
    this.fallbackFor = const [],
  });

  RawIcon icon;
  String name;
  int brandColor;
  String deepLinkPrefix;
  bool requirePreVerification;
  List<String> fallbackFor;
}
