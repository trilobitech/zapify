import 'package:analytics_core/analytics_core.dart';
import 'package:config_manager_core/config_manager_core.dart';
import 'package:di_core/di_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'ads/ad_banner_module.dart';
import 'analytics/amplitude.dart';
import 'analytics/firebase.dart';
import 'firebase_config_storage.dart';
import 'top_banner/top_banner_module.dart';

Future<void> loadModules() async {
  final analytics = CompositeAnalytics([
    FirebaseAnalyticsWrapper(),
    AmplitudeAnalyticsWrapper(),
  ]);

  registerLazySingleton<IRemoteConfigStorage>(
    () => FirebaseConfigStorage.create(
      remoteConfig: FirebaseRemoteConfig.instance,
      defaults: get(),
    ),
  );

  registerSingleton<IAnalytics>(() => analytics);

  adModules();

  topBannerModule();

  return await analytics.init();
}
