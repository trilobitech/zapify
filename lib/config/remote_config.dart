import 'package:config_core/config_core.dart';
import 'package:flutter/foundation.dart';

import '../core/di/inject.dart' as di;
import 'env_config.dart';

enum RemoteConfig with KeyValueMixin<IRemoteConfigStorage> {
  chatAppsSourceUrl,
  homeBannerUnitId,
  isCallLogTabEnabled;

  @override
  String get key => name;

  @override
  Future<IRemoteConfigStorage> get storage => di.lazyGet();
}

Map<String, dynamic> get remoteConfigDefaults => {
      RemoteConfig.chatAppsSourceUrl.key: 'assets://data/chat-apps.json',
      RemoteConfig.homeBannerUnitId.key: EnvConfig.homeBannerUnitId,
      RemoteConfig.isCallLogTabEnabled.key: kDebugMode,
    };
