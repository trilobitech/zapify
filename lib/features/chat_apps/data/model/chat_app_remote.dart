import '../../../shared/domain/entity/color.dart';
import '../../domain/entity/chat_app.dart';

class ChatAppRemote extends ChatApp {
  const ChatAppRemote({
    required Uri icon,
    required String name,
    required Color brandColor,
    required String deepLinkPrefix,
    this.requirePreVerification = false,
    this.fallbackFor = const [],
  }) : super(
          icon: icon,
          name: name,
          brandColor: brandColor,
          deepLinkPrefix: deepLinkPrefix,
        );

  factory ChatAppRemote.fromJson(Map<String, dynamic> json) => ChatAppRemote(
        icon: Uri.parse(json['icon']),
        name: json['name'],
        brandColor: Color(json['brand_color']),
        deepLinkPrefix: json['deeplink_prefix'],
        requirePreVerification: json['require_pre_verification'] == true,
        fallbackFor: json['fallback_for']?.whereType<String>()?.toList() ?? [],
      );

  final bool requirePreVerification;
  final List<String> fallbackFor;

  static List<ChatAppRemote> fromJsonList(List<dynamic> json) =>
      json.map<ChatAppRemote>((e) => ChatAppRemote.fromJson(e)).toList();
}
