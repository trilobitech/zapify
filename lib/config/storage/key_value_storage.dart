abstract class KeyValueStorageReadOnly {
  T getValue<T extends Object>(String key);
}

abstract class KeyValueStorage implements KeyValueStorageReadOnly {
  Future setValue<T extends Object>(String key, T value);
}

abstract class LocalConfigStorage implements KeyValueStorage {}

abstract class RemoteConfigStorage implements KeyValueStorageReadOnly {}
