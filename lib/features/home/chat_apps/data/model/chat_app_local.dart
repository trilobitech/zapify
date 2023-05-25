import '../../domain/entity/chat_app.dart';
import '../../domain/entity/color.dart';

class ChatAppLocal extends ChatApp {
  const ChatAppLocal({
    required this.id,
    required super.name,
    required super.icon,
    required super.brandColor,
    required super.deepLinkTemplate,
  });

  factory ChatAppLocal.fromJson(Map<String, dynamic> json) => ChatAppLocal(
        id: json['id'],
        name: json['name'],
        icon: Uri.parse(json['icon']),
        brandColor: Color(json['brand_color']),
        deepLinkTemplate: json['deeplink_template'],
      );

  final int id;

  @override
  List get props => [id, ...super.props];
}
