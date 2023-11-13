import 'dart:collection';

abstract class KeyValueStorage {
  T getValue<T extends Object?>(String key);
}

abstract class KeyValueWritableStorage implements KeyValueStorage {
  Future setValue<T extends Object>(String key, T value);
}

abstract class ILocalConfigStorage implements KeyValueWritableStorage {}

abstract class IRemoteConfigStorage implements KeyValueStorage {}

class RemoteConfigDefaults extends MapBase<String, dynamic>
    with MapMixin<String, dynamic> {
  RemoteConfigDefaults(this._data);

  final Map<String, dynamic> _data;

  @override
  operator [](Object? key) => _data[key];

  @override
  void operator []=(String key, value) => _data[key] = value;

  @override
  void clear() => _data.clear();

  @override
  Iterable<String> get keys => _data.keys;

  @override
  remove(Object? key) => _data.remove(key);
}
