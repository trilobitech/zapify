import 'package:config_core/config_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseConfigStorage implements IRemoteConfigStorage {
  FirebaseConfigStorage({required FirebaseRemoteConfig remoteConfig}) : _remoteConfig = remoteConfig;

  final FirebaseRemoteConfig _remoteConfig;

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
}
