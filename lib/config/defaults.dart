import 'package:flutter/foundation.dart';
import 'package:zapify/config/local_config.dart';
import 'package:zapify/config/remote_config.dart';

final Map<String, dynamic> localConfigDefaults = {
  LocalConfig.historicSize.key: 0,
};

final Map<String, dynamic> remoteConfigDefaults = {
  RemoteConfig.chatAppsSourceUrl.key: 'assets://data/chat-apps.json',
  RemoteConfig.homeBannerUnitId.key:
      kDebugMode ? 'ca-app-pub-3940256099942544/6300978111' : '',
};
