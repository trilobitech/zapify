import 'package:url_launcher/url_launcher.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/repository/chat_app_repository.dart';

class ChatAppRepository implements IChatAppRepository {
  @override
  Future<List<ChatApp>> getAll() async {
    final knownApps = _allKnownApps();

    return await _filterSupportedApps(knownApps);
  }

  Future<List<ChatApp>> _filterSupportedApps(List<ChatApp> apps) async {
    final validated = await Future.wait(apps.map(_validate));
    return validated.whereType<ChatApp>().toList();
  }

  Future<ChatApp?> _validate(ChatApp app) async =>
      await _canLaunchApp(app) ? app : null;

  Future<bool> _canLaunchApp(ChatApp app) async {
    if (app.requirePreVerification) {
      return await _canLaunchUrl(app.deepLinkPrefix);
    }

    return app.fallbackFor.fold(
      Future.value(true),
      (previousValue, element) async =>
          (await previousValue) & !(await _canLaunchUrl(element)),
    );
  }

  Future<bool> _canLaunchUrl(String url) => canLaunchUrl(Uri.parse(url));

  List<ChatApp> _allKnownApps() {
    return [
      ChatApp(
        icon: Uri.parse('assets/icons/whatsapp.svg'),
        name: 'WhatsApp',
        brandColor: 0xff25d366,
        deepLinkPrefix: 'whatsapp-consumer://send?phone=',
        requirePreVerification: true,
      ),
      ChatApp(
        icon: Uri.parse('assets/icons/whatsapp-business.svg'),
        name: 'WhatsApp Business',
        brandColor: 0xff25d366,
        deepLinkPrefix: 'whatsapp-smb://send?phone=',
        requirePreVerification: true,
      ),
      ChatApp(
        icon: Uri.parse('assets/icons/whatsapp.svg'),
        name: 'WhatsApp',
        brandColor: 0xff25d366,
        deepLinkPrefix: 'https://wa.me/',
        fallbackFor: [
          'whatsapp-consumer://send',
          'whatsapp-smb://send',
        ],
      ),
      ChatApp(
        icon: Uri.parse('assets/icons/telegram.svg'),
        name: 'Telegram',
        brandColor: 0xff0088cc,
        deepLinkPrefix: 'https://t.me/',
      ),
      ChatApp(
        icon: Uri.parse('assets/icons/signal.svg'),
        name: 'Signal',
        brandColor: 0xff3a76f0,
        deepLinkPrefix: 'https://signal.me/#p/+',
      ),
    ];
  }
}
