import 'package:analytics/analytics.dart';
import 'package:config_core/config_core.dart';
import 'package:config_firebase/config_firebase.dart';
import 'package:error_adapter/error_adapter.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../common/ext/context.dart';
import 'config/local_config.dart';
import 'config/remote_config.dart';
import 'data/db.dart';
import 'di/definition.dart';
import 'services/firebase.dart';
import 'widgets/feedback_view.dart';

void commonModule() {
  registerFactoryParam<FailureAdapter, ErrorConverterRegistry, void>(
    (registry, _) => FailureAdapter(
      registry: registry,
      fallback: (context, _) => ErrorFeedback(
        message: context.strings.unknowErrorMessage,
        primaryButtonText: context.strings.unknowErrorAction,
      ),
    ),
  );

  registerSingleton(() => PhoneNumberUtil());

  registerSingletonAsync<Database>(
    getDatabase,
    dispose: (db) async => db.close(),
  );

  registerSingletonAsync<BriteDatabase>(
    () async => BriteDatabase(
      await lazyGet(),
      logger: kDebugMode ? print : null,
    ),
    dispose: (db) async => db.close(),
  );

  registerSingletonAsync<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  registerSingletonAsync<FirebaseRemoteConfig>(
    () async => getRemoteConfig(remoteConfigDefaults),
  );

  registerSingleton<IRemoteConfigStorage>(
    () => FirebaseConfigStorage(
      remoteConfig: get(),
    ),
    dependsOn: [FirebaseRemoteConfig],
  );

  registerSingleton<ILocalConfigStorage>(
    () => PreferencesConfigStorage(
      prefs: get(),
      localConfigDefaults: localConfigDefaults,
    ),
    dependsOn: [SharedPreferences],
  );

  registerSingleton<IAnalytics>(
    () => analytics,
  );
}
