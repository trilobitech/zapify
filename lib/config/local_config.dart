import 'package:zapify/config/storage/key_value_storage.dart';
import 'package:zapify/core/di/inject.dart' as di;

const appId = 'com.zapfy.app';

enum LocalConfig {
  historicSize,
}

extension LocalConfigExt on LocalConfig {
  String get key => '$appId\$$name';

  Future set<T extends Object>(T value) =>
      di.get<LocalConfigStorage>().setValue(key, value);

  T get<T extends Object>() => di.get<LocalConfigStorage>().getValue(key);
}
