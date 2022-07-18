import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:zapfy/config/defaults.dart';

Future<FirebaseRemoteConfig> getRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await Future.wait([
    remoteConfig.setDefaults(remoteConfigDefaults),
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
