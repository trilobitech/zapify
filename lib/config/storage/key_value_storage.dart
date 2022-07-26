abstract class KeyValueStorageReadOnly {
  T getValue<T extends Object>(String key);
}

abstract class KeyValueStorage implements KeyValueStorageReadOnly {
  Future setValue<T extends Object>(String key, T value);
}

abstract class LocalConfigStorage implements KeyValueStorage {}

abstract class RemoteConfigStorage implements KeyValueStorageReadOnly {}

extension KeyValueStorageReadOnlyExt<S extends KeyValueStorageReadOnly>
    on Future<S> {
  Future<T> getValueAsync<T extends Object>(String key) =>
      then((s) => s.getValue<T>(key));
}

extension KeyValueStorageeExt<S extends KeyValueStorage> on Future<S> {
  Future setValueAsync<T extends Object>(String key, T value) =>
      then((s) => s.setValue(key, value));
}
