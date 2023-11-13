import 'dart:io';

import 'package:config_manager_core/config_manager_core.dart';
import 'package:di_core/di_core.dart' as di;
import 'package:flutter/foundation.dart';

import 'env_config.dart';

enum RemoteConfig with KeyValueMixin<IRemoteConfigStorage> {
  homeBannerUnitId,
  isCallLogTabEnabled,
  isRequestReviewEnabled;

  @override
  String get key => name;

  @override
  Future<IRemoteConfigStorage> get storage => di.lazyGet();
}

Map<String, dynamic> get remoteConfigDefaults => {
      RemoteConfig.homeBannerUnitId.key: EnvConfig.homeBannerUnitId,
      RemoteConfig.isCallLogTabEnabled.key: kDebugMode && Platform.isAndroid,
      RemoteConfig.isRequestReviewEnabled.key: kDebugMode,
    };
