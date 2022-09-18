import 'package:config_core/config_core.dart';

import '../core/di/inject.dart' as di;
import 'env_config.dart';

enum RemoteConfig with KeyValueMixin<IRemoteConfigStorage> {
  chatAppsSourceUrl,
  homeBannerUnitId;

  @override
  String get key => name;

  @override
  Future<IRemoteConfigStorage> get storage => di.lazyGet();
}

Future<Map<String, dynamic>> get remoteConfigDefaults async => {
      RemoteConfig.chatAppsSourceUrl.key: 'assets://data/chat-apps.json',
      RemoteConfig.homeBannerUnitId.key: await EnvConfig.homeBannerUnitId.get(),
    };
