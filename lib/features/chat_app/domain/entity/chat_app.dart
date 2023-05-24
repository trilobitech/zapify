import 'package:equatable/equatable.dart';

import 'color.dart';

class ChatApp extends Equatable {
  const ChatApp({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.deeplinkTemplate,
    required this.isEnabled,
  });

  final int id;
  final String name;
  final Color color;
  final Uri icon;
  final String deeplinkTemplate;
  final bool isEnabled;

  @override
  List get props => [id, name, color, icon, deeplinkTemplate, isEnabled];
}
