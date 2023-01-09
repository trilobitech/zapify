import '../common/common_module.dart';
import '../config/config_module.dart';
import '../features/call_log/call_log_module.dart';
import '../features/history/history_module.dart';
import '../features/home/home_module.dart';
import '../features/region/region_module.dart';
import 'definition.dart';

Future<void> loadModules() async {
  configModule();
  commonModule();
  homeModule();
  historyModule();
  regionModule();
  callLogModule();
  await getIt.allReady();
}
