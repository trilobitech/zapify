import 'package:equatable/equatable.dart';

import 'color.dart';

class ChatApp extends Equatable {
  const ChatApp({
    required this.name,
    required this.icon,
    required this.brandColor,
    required this.deepLinkTemplate,
  });

  final String name;
  final Uri icon;
  final Color brandColor;
  final String deepLinkTemplate;

  @override
  List get props => [name, icon, brandColor, deepLinkTemplate];

  @override
  bool get stringify => true;
}
