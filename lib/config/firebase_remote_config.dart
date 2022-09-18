import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

Future<FirebaseRemoteConfig> getRemoteConfig(
  Map<String, dynamic> defaults,
) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setDefaults(defaults);
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
