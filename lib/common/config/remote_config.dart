import 'dart:io';

import 'package:config_core/config_core.dart';
import 'package:flutter/foundation.dart';

import '../di/inject.dart' as di;
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
