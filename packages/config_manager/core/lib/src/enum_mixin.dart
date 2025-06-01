import 'package:meta/meta.dart';

import 'key_value_storage.dart';

mixin KeyValueMixin<Storage extends KeyValueStorage> {
  String get key;

  @visibleForOverriding
  Future<Storage> get storage;

  Future<T> get<T extends Object?>() async {
    final storage = await this.storage;
    return storage.getValue<T>(key);
  }
}

mixin KeyValueWritableMixin<Storage extends KeyValueWritableStorage>
    on KeyValueMixin<Storage> {
  Stream<T> watch<T extends Object>() =>
      storage.asStream().asyncExpand((storage) => storage.watchValue(key));

  Future<void> set<T extends Object>(T value) async {
    final storage = await this.storage;
    await storage.setValue(key, value);
  }
}
