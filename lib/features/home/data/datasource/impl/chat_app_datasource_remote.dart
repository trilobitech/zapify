import 'dart:convert';

import 'package:http/http.dart';
import 'package:zapfy/core/data/network/ext.dart';
import 'package:zapfy/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapfy/features/home/data/model/chat_app_remote.dart';
import 'package:zapfy/features/shared/data/remote_config.dart';

class ChatAppDataSourceRemoteImpl implements ChatAppDataSourceRemote {
  ChatAppDataSourceRemoteImpl({
    required this.httpClient,
    required this.remoteConfig,
  });

  final Client httpClient;
  final RemoteConfig remoteConfig;

  @override
  Future<List<ChatAppRemote>> get() {
    final sourceUrl =
        remoteConfig.get(RemoteConfigKey.chatAppsSourceUrl).asString();

    return httpClient
        .get(Uri.parse(sourceUrl))
        .mapJsonWith(ChatAppRemote.fromJsonList);
  }
}
