import '../core/di/inject.dart' as di;
import 'storage/enum_mixin.dart';
import 'storage/key_value_storage.dart';

enum EnvConfig with KeyValueMixin<IEnvConfigStorage> {
  amplitudeKey,
  homeBannerUnitId;

  @override
  String get key => 'Zapify_$name';

  @override
  Future<IEnvConfigStorage> get storage => di.lazyGet();
}

final Map<String, dynamic> envConfigDefaults = {
  EnvConfig.amplitudeKey.key: '',
  EnvConfig.homeBannerUnitId.key: '',
};
