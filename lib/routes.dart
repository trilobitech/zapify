import 'package:flutter/material.dart';
import 'package:simple_nav/simple_nav.dart';

import 'common/ext/navigator.dart';
import 'features/chat_app/presentation/chat_app_page.dart';
import 'features/home/main/home_page.dart';
import 'features/region/presentation/region_picker_page.dart';
import 'features/settings/presentation/settings_page.dart';

class RoutePaths {
  const RoutePaths._();

  static const home = '/';
  static const regions = '/regions';
  static const settings = '/settings';
  static const messagingAppsSettings = '/messaging_apps';
}

final routes = <String, RouteBuilder>{
  RoutePaths.home: (settings, _) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'HomePage'),
      builder: (_) => const HomePage(),
    );
  },

  RoutePaths.regions: (settings, extras) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: const RouteSettings(name: 'RegionPicker'),
      builder:
          (_) => RegionPicker(selected: extras.getFromData('selected_code')),
    );
  },

  RoutePaths.settings: (settings, extras) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'SettingsPage'),
      builder: (_) => const SettingsPage(),
    );
  },

  RoutePaths.messagingAppsSettings: (settings, extras) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'ChatAppSettingsPage'),
      builder: (_) => const ChatAppSettingsPage(),
    );
  },
};
