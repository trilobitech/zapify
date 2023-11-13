import 'package:config/config.dart';
import 'package:di_core/di_core.dart';
import 'package:resources/module.dart';

import 'common/common_module.dart';
import 'features/call_log/call_log_module.dart';
import 'features/chat_app/chat_app_module.dart';
import 'features/history/history_module.dart';
import 'features/home/home_module.dart';
import 'features/region/region_module.dart';
import 'features/settings/settings_module.dart';

Future<void> loadModules() async {
  commonModule();
  l10nModule();
  configModules();
  homeModule();
  chatAppModule();
  historyModule();
  regionModule();
  callLogModule();
  settingsModule();

  await allReady();
}
