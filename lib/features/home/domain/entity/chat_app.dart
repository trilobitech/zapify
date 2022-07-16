class ChatApp {
  ChatApp({
    required this.icon,
    required this.name,
    required this.brandColor,
    required this.deepLinkPrefix,
    this.requirePreVerification = false,
    this.fallbackFor = const [],
  });

  Uri icon;
  String name;
  int brandColor;
  String deepLinkPrefix;
  bool requirePreVerification;
  List<String> fallbackFor;
}
