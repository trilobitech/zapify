import 'package:config_manager_core/config_manager_core.dart';
import 'package:di_core/di_core.dart' as di;

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
