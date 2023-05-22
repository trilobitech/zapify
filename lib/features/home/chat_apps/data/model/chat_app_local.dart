import '../../domain/entity/chat_app.dart';
import '../../domain/entity/color.dart';

class ChatAppLocal extends ChatApp {
  const ChatAppLocal({
    required this.id,
    required super.name,
    required super.icon,
    required super.brandColor,
    required super.deepLinkPrefix,
  });

  factory ChatAppLocal.fromJson(Map<String, dynamic> json) => ChatAppLocal(
        id: json['id'],
        name: json['name'],
        icon: Uri.parse(json['icon']),
        brandColor: Color(json['brand_color']),
        deepLinkPrefix: json['deeplink_prefix'],
      );

  final int id;

  @override
  List get props => [id, ...super.props];
}
