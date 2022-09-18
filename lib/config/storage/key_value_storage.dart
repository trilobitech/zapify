abstract class KeyValueStorage {
  T getValue<T extends Object?>(String key);
}

abstract class KeyValueWritableStorage implements KeyValueStorage {
  Future setValue<T extends Object>(String key, T value);
}

abstract class IEnvConfigStorage implements KeyValueStorage {}

abstract class ILocalConfigStorage implements KeyValueWritableStorage {}

abstract class IRemoteConfigStorage implements KeyValueStorage {}
