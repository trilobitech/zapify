import 'package:analytics_core/analytics_core.dart';
import 'package:config_manager_core/config_manager_core.dart';
import 'package:di_core/di_core.dart';

import 'analytics.dart';
import 'fake_remote_config.dart';

void loadModules() {
  registerLazySingleton<IRemoteConfigStorage>(
    () async => FakeRemoteConfigStorage(
      defaults: get(),
    ),
  );

  registerSingleton<IAnalytics>(
    () => LoggerAnalytics(),
  );
}
