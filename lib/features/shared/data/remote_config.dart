import 'package:firebase_remote_config/firebase_remote_config.dart';

typedef RemoteConfig = FirebaseRemoteConfig;

Future<FirebaseRemoteConfig> getRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await Future.wait([
    remoteConfig.setDefaults({
      RemoteConfigKey.chatAppsSourceUrl.name: "assets://data/chat-apps.json",
    }),
    remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(days: 1),
      ),
    )
  ]);

  remoteConfig.fetchAndActivate();

  return remoteConfig;
}

enum RemoteConfigKey { chatAppsSourceUrl }

extension RemoteConfigExt on RemoteConfig {
  RemoteConfigValue get(RemoteConfigKey key) => getValue(key.name);
}
