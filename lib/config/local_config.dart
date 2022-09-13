import 'package:zapify/config/storage/key_value_storage.dart';
import 'package:zapify/core/di/inject.dart' as di;

const appId = 'com.zapfy.app';

enum LocalConfig {
  historicSize,
  chatAppsExpiration,
  lastAppReviewAt;

  String get key => '$appId\$$name';
  Future<LocalConfigStorage> get _storage => di.lazyGet();

  Future<void> set<T extends Object>(T value) =>
      _storage.setValueAsync(key, value);

  Future<T> get<T extends Object?>() => _storage.getValueAsync(key);
}
