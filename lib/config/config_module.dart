import 'package:config_core/config_core.dart';
import 'package:config_firebase/config_firebase.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/di/definition.dart';
import '../core/di/inject.dart';
import 'firebase_remote_config.dart';
import 'local_config.dart';
import 'remote_config.dart';

void configModule() {
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
