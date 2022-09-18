import 'key_value_storage.dart';

mixin KeyValueMixin<Storage extends KeyValueStorage> {
  String get key;

  Future<Storage> get storage;
  Future<T> get<T extends Object?>() async => (await storage).getValue(key);
}

mixin KeyValueWritableMixin<Storage extends KeyValueWritableStorage>
    on KeyValueMixin<Storage> {
  Future<void> set<T extends Object>(T value) async {
    final storage = await this.storage;
    await storage.setValue(key, value);
  }
}
