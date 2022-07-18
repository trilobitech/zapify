import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/history/history_module.dart';
import 'package:zapfy/features/home/home_module.dart';
import 'package:zapfy/features/region/region_module.dart';
import 'package:zapfy/features/shared/shared_module.dart';

Future<void> loadModules() async {
  sharedModule();
  homeModule();
  historyModule();
  regionModule();
  await getIt.allReady();
}
