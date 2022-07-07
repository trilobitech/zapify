import 'package:url_launcher/url_launcher.dart';
import 'package:zapfy/app/home/models/app_info.dart';

abstract class IChatAppLauncher {
  Future launch(String phoneNumber);

  AppInfo info();
}

abstract class AbstractChatAppLauncher implements IChatAppLauncher {
  String buildAppDeeplink(String phoneNumber);

  @override
  launch(String phoneNumber) async {
    final Uri uri = Uri.parse(buildAppDeeplink(phoneNumber));
    if (!await canLaunchUrl(uri) ||
        !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
