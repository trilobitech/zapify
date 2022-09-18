import '../core/di/inject.dart' as di;
import 'storage/enum_mixin.dart';
import 'storage/key_value_storage.dart';

const _appId = 'com.zapfy.app';

enum LocalConfig
    with
        KeyValueMixin<ILocalConfigStorage>,
        KeyValueWritableMixin<ILocalConfigStorage> {
  historicSize,
  chatAppsExpiration,
  lastAppReviewAt;

  @override
  String get key => '$_appId\$$name';

  @override
  Future<ILocalConfigStorage> get storage => di.lazyGet();
}

final Map<String, dynamic> localConfigDefaults = {
  LocalConfig.historicSize.key: 0,
  LocalConfig.chatAppsExpiration.key: -1,
};
