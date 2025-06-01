abstract class KeyValueStorage {
  T getValue<T extends Object?>(String key);
}

abstract class KeyValueWritableStorage implements KeyValueStorage {
  Stream<T> watchValue<T extends Object>(String key);

  Future setValue<T extends Object>(String key, T value);
}

abstract class ILocalConfigStorage implements KeyValueWritableStorage {
  Future<void> close() async {
    // do nothing
  }
}

abstract class IRemoteConfigStorage implements KeyValueStorage {}
