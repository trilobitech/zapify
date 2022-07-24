import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:zapify/config/defaults.dart';
import 'package:zapify/core/logger.dart';

Future<FirebaseRemoteConfig> getRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setDefaults(remoteConfigDefaults);
  await remoteConfig.activate();

  _fetch(remoteConfig).catchError(catchErrorLogger);

  return remoteConfig;
}

Future<void> _fetch(FirebaseRemoteConfig remoteConfig) async {
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(days: 1),
    ),
  );
  await remoteConfig.fetch();
}
