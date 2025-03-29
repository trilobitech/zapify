import '../../domain/entity/chat_app.dart';
import '../../domain/entity/color.dart';

class ChatAppModel extends ChatApp {
  const ChatAppModel({
    required super.id,
    required super.name,
    required super.color,
    required super.icon,
    required super.deeplinkTemplate,
    required super.isEnabled,
  });

  factory ChatAppModel.fromJson(Map<String, dynamic> json) => ChatAppModel(
    id: json['id'],
    name: json['name'],
    icon: Uri.parse(json['icon']),
    color: Color(json['brand_color']),
    deeplinkTemplate: json['deeplink_template'],
    isEnabled: json['is_enabled'] == 1,
  );
}
