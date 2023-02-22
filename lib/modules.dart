import 'common/common_module.dart';
import 'common/di/definition.dart';
import 'features/call_log/call_log_module.dart';
import 'features/history/history_module.dart';
import 'features/home/home_module.dart';
import 'features/region/region_module.dart';

Future<void> loadModules() async {
  commonModule();
  homeModule();
  historyModule();
  regionModule();
  callLogModule();
  await allReady();
}
