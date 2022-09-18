import 'package:config_core/config_core.dart';

import '../core/di/inject.dart' as di;

enum EnvConfig with KeyValueMixin<IEnvConfigStorage> {
  amplitudeKey,
  homeBannerUnitId;

  @override
  String get key => 'Zapify_$name';

  @override
  Future<IEnvConfigStorage> get storage => di.lazyGet();
}

Map<String, dynamic> get envConfigDefaults => {
  EnvConfig.amplitudeKey.key: '',
  EnvConfig.homeBannerUnitId.key: '',
};
