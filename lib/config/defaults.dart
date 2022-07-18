import 'package:zapfy/config/local_config.dart';
import 'package:zapfy/config/remote_config.dart';

final Map<String, dynamic> localConfigDefaults = {
  LocalConfig.historicSize.key: 0,
};

final Map<String, dynamic> remoteConfigDefaults = {
  RemoteConfig.chatAppsSourceUrl.key: "assets://data/chat-apps.json",
};
