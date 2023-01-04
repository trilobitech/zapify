import '../config/config_module.dart';
import '../core/di/inject.dart';
import '../features/call_log/call_log_module.dart';
import '../features/chat_apps/chat_apps_module.dart';
import '../features/history/history_module.dart';
import '../features/home/home_module.dart';
import '../features/region/region_module.dart';
import '../features/shared/shared_module.dart';

Future<void> loadModules() async {
  configModule();
  sharedModule();
  homeModule();
  chatAppsModule();
  historyModule();
  regionModule();
  callLogModule();
  await getIt.allReady();
}
