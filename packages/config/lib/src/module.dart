import 'package:config_manager_core/config_manager_core.dart';
import 'package:di_core/di_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'impl/preferences_storage.dart';
import 'local_config.dart';
import 'remote_config.dart';

void configModules() {
  registerSingletonAsync<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  registerSingleton<ILocalConfigStorage>(
    () => PreferencesConfigStorage(
      prefs: get(),
      localConfigDefaults: localConfigDefaults,
    ),
    dependsOn: [SharedPreferences],
  );

  registerSingleton<RemoteConfigDefaults>(
    () => RemoteConfigDefaults(remoteConfigDefaults),
  );
}
