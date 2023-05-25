import 'package:flutter/material.dart';
import 'package:simple_nav/simple_nav.dart';

import 'features/home/main/home_page.dart';
import 'features/region/presentation/region_picker_page.dart';
import 'features/settings/presentation/settings_page.dart';

final routes = <String, RouteBuilder>{
  '/': (settings, _) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'HomePage'),
      builder: (_) => const HomePage(),
    );
  },
  '/regions': (settings, extras) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: const RouteSettings(name: 'RegionPicker'),
      builder: (_) => RegionPicker(
        selected: extras.data['selected_code'],
      ),
    );
  },
  '/settings': (settings, extras) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'SettingsPage'),
      builder: (_) => const SettingsPage(),
    );
  }
};
