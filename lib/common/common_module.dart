import 'package:config_core/config_core.dart';
import 'package:config_firebase/config_firebase.dart';
import 'package:error_adapter/error_adapter.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_plus/http_client_plus.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../common/ext/context.dart';
import '../di/definition.dart';
import 'config/local_config.dart';
import 'config/remote_config.dart';
import 'data/db.dart';
import 'data/network/user_agent_interceptor.dart';
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

  registerSingleton<Future<Database>>(
    () => getDatabase(),
    dispose: (param) => param.then((db) => db.close()),
  );

  registerSingleton<Future<BriteDatabase>>(
    () => getDatabase().then(
      (db) => BriteDatabase(db, logger: kDebugMode ? print : null),
    ),
    dispose: (param) => param.then((db) => db.close()),
  );

  registerSingleton<http.Client>(
    () => InterceptableClient.withDefaultInterceptors(interceptors: [
      UserAgentInterceptor(),
    ]),
  );

  registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  registerSingletonAsync<FirebaseRemoteConfig>(
    () => getRemoteConfig(remoteConfigDefaults),
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
}
