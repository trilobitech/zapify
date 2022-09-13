import 'package:zapify/config/storage/key_value_storage.dart';
import 'package:zapify/core/di/inject.dart' as di;

enum RemoteConfig {
  chatAppsSourceUrl,
  homeBannerUnitId;

  String get key => name;

  Future<T> get<T extends Object>() =>
      di.lazyGet<RemoteConfigStorage>().getValueAsync(key);
}
