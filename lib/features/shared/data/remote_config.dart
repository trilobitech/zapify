import 'package:firebase_remote_config/firebase_remote_config.dart';

typedef RemoteConfig = FirebaseRemoteConfig;

Future<FirebaseRemoteConfig> getRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(days: 1),
    ),
  );

  remoteConfig.fetchAndActivate();

  return remoteConfig;
}
