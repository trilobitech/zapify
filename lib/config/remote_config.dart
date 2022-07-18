import 'package:zapfy/config/storage/key_value_storage.dart';
import 'package:zapfy/core/di/inject.dart' as di;

enum RemoteConfig {
  chatAppsSourceUrl,
}

extension RemoteConfigExt on RemoteConfig {
  String get key => name;

  T get<T extends Object>() => di.get<RemoteConfigStorage>().getValue(key);
}
