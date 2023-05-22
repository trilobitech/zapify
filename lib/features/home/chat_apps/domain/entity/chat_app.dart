import 'package:equatable/equatable.dart';

import 'color.dart';

class ChatApp extends Equatable {
  const ChatApp({
    required this.name,
    required this.icon,
    required this.brandColor,
    required this.deepLinkPrefix,
  });

  final String name;
  final Uri icon;
  final Color brandColor;
  final String deepLinkPrefix;

  @override
  List get props => [name, icon, brandColor, deepLinkPrefix];

  @override
  bool get stringify => true;
}
