import 'dart:io';

import 'package:config_core/config_core.dart';
import 'package:flutter/foundation.dart';

import '../di/inject.dart' as di;
import 'env_config.dart';

enum RemoteConfig with KeyValueMixin<IRemoteConfigStorage> {
  homeBannerUnitId,
  homeAdListUnitId,
  homeAdListInterval,
  isCallLogTabEnabled,
  isRequestReviewEnabled,
  askForReviewDaysInterval;

  @override
  String get key => name;

  @override
  Future<IRemoteConfigStorage> get storage => di.lazyGet();
}

Map<String, dynamic> get remoteConfigDefaults => {
  RemoteConfig.homeBannerUnitId.key: EnvConfig.homeBannerUnitId,
  RemoteConfig.homeAdListUnitId.key: EnvConfig.homeAdListUnitId,
  RemoteConfig.homeAdListInterval.key: 5,
  RemoteConfig.isCallLogTabEnabled.key: kDebugMode && Platform.isAndroid,
  RemoteConfig.isRequestReviewEnabled.key: false,
  RemoteConfig.askForReviewDaysInterval.key: 30,
};
