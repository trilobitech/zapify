import 'package:zapify/features/home/domain/entity/chat_app.dart';
import 'package:zapify/features/home/domain/entity/color.dart';

class ChatAppLocal extends ChatApp {
  const ChatAppLocal({
    required this.id,
    required String name,
    required Uri icon,
    required Color brandColor,
    required String deepLinkPrefix,
  }) : super(
          name: name,
          icon: icon,
          brandColor: brandColor,
          deepLinkPrefix: deepLinkPrefix,
        );

  final int id;

  @override
  List get props => [id, ...super.props];

  factory ChatAppLocal.fromJson(Map<String, dynamic> json) => ChatAppLocal(
        id: json['id'],
        name: json['name'],
        icon: Uri.parse(json['icon']),
        brandColor: Color(json['brand_color']),
        deepLinkPrefix: json['deeplink_prefix'],
      );

  factory ChatAppLocal.fromEntity(int id, ChatApp entity) {
    if (entity is ChatAppLocal) {
      return entity;
    }
    return ChatAppLocal(
      id: id,
      name: entity.name,
      icon: entity.icon,
      brandColor: entity.brandColor,
      deepLinkPrefix: entity.deepLinkPrefix,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon.toString(),
        'brand_color': brandColor.toString(),
        'deeplink_prefix': deepLinkPrefix,
      };
}
