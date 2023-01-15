import 'package:equatable/equatable.dart';

import 'color.dart';

class ChatApp extends Equatable {
  const ChatApp({
    required this.name,
    required this.icon,
    required this.brandColor,
    required this.deepLinkPrefix,
  });

  factory ChatApp.fromJson(Map<String, dynamic> json) => ChatApp(
        name: json['name'],
        icon: Uri.parse(json['icon']),
        brandColor: Color(json['brand_color']),
        deepLinkPrefix: json['deeplink_prefix'],
      );

  final String name;
  final Uri icon;
  final Color brandColor;
  final String deepLinkPrefix;

  @override
  List get props => [name, icon, brandColor, deepLinkPrefix];

  @override
  bool get stringify => true;
}
