import 'package:config_core/config_core.dart';

import '../di/inject.dart' as di;

const _appId = 'com.zapfy.app';

enum LocalConfig
    with
        KeyValueMixin<ILocalConfigStorage>,
        KeyValueWritableMixin<ILocalConfigStorage> {
  historicSize,
  lastAppReviewAt,
  defaultRegion;

  @override
  String get key => '$_appId\$$name';

  @override
  Future<ILocalConfigStorage> get storage => di.lazyGet();
}

Map<String, dynamic> get localConfigDefaults => {
  LocalConfig.historicSize.key: 0,
};
