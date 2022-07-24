import 'package:equatable/equatable.dart';
import 'package:zapify/features/home/domain/entity/color.dart';

class ChatApp extends Equatable {
  const ChatApp({
    required this.name,
    required this.icon,
    required this.brandColor,
    required this.deepLinkPrefix,
  });

  final Uri icon;
  final String name;
  final Color brandColor;
  final String deepLinkPrefix;

  factory ChatApp.fromJson(Map<String, dynamic> json) => ChatApp(
        name: json['name'],
        icon: Uri.parse(json['icon']),
        brandColor: Color(json['brand_color']),
        deepLinkPrefix: json['deeplink_prefix'],
      );

  @override
  List get props => [name, icon, brandColor, deepLinkPrefix];

  @override
  bool get stringify => true;
}
