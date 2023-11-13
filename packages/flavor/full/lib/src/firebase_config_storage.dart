import 'package:config_manager_core/config_manager_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'logger.dart';

abstract class IFirebaseRemoteConfigWrapper {
  RemoteConfigValue getValue(String key);
}

class FirebaseConfigStorage implements IRemoteConfigStorage {
  FirebaseConfigStorage({
    required FirebaseRemoteConfig remoteConfig,
  }) : _remoteConfig = remoteConfig;

  final FirebaseRemoteConfig _remoteConfig;

  static Future<IRemoteConfigStorage> create({
    required FirebaseRemoteConfig remoteConfig,
    required RemoteConfigDefaults defaults,
  }) async {
    final self = FirebaseConfigStorage(
      remoteConfig: remoteConfig,
    );

    await remoteConfig.setDefaults(defaults);
    await remoteConfig.activate();

    _fetch(remoteConfig);

    return self;
  }

  @override
  T getValue<T extends Object?>(String key) {
    final value = _remoteConfig.getValue(key);

    final type = T.toString();
    switch (type) {
      case 'bool':
        return value.asBool() as T;
      case 'String':
        return value.asString() as T;
      case 'int':
        return value.asInt() as T;
      case 'double':
        return value.asDouble() as T;
      default:
        throw UnsupportedError('Invalid type: "${T.toString()}"');
    }
  }

  static void _fetch(FirebaseRemoteConfig remoteConfig) async {
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(days: 1),
        ),
      );
      await remoteConfig.fetch();
      logger.config('Remote config fetched');
    } catch (error, stack) {
      logger.warning('Remote config fetch failed', error, stack);
    }
  }
}
