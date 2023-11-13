import 'dart:collection';

abstract class KeyValueStorage {
  T getValue<T extends Object?>(String key);
}

abstract class KeyValueWritableStorage implements KeyValueStorage {
  Future setValue<T extends Object>(String key, T value);
}

abstract class ILocalConfigStorage implements KeyValueWritableStorage {}

abstract class IRemoteConfigStorage implements KeyValueStorage {}

class RemoteConfigDefaults
    with MapMixin<String, dynamic>
    implements Map<String, dynamic> {
  RemoteConfigDefaults(this._data);

  final Map<String, dynamic> _data;

  @override
  dynamic operator [](Object? key) => _data[key];

  @override
  void operator []=(String key, value) => _data[key] = value;

  @override
  void clear() => _data.clear();

  @override
  Iterable<String> get keys => _data.keys;

  @override
  dynamic remove(Object? key) => _data.remove(key);
}
