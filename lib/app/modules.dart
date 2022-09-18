import 'package:zapify/config/config_module.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/features/history/history_module.dart';
import 'package:zapify/features/home/home_module.dart';
import 'package:zapify/features/region/region_module.dart';
import 'package:zapify/features/shared/shared_module.dart';

Future<void> loadModules() async {
  configModule();
  sharedModule();
  homeModule();
  historyModule();
  regionModule();
  await getIt.allReady();
}
