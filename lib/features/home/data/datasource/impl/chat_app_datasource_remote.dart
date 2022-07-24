import 'package:http/http.dart';
import 'package:zapify/config/remote_config.dart';
import 'package:zapify/core/data/network/ext.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/model/chat_app_remote.dart';

class ChatAppDataSourceRemoteImpl implements ChatAppDataSourceRemote {
  ChatAppDataSourceRemoteImpl({
    required this.httpClient,
  });

  final Client httpClient;

  @override
  Future<List<ChatAppRemote>> get() {
    final sourceUrl = RemoteConfig.chatAppsSourceUrl.get<String>();

    return httpClient
        .get(Uri.parse(sourceUrl))
        .mapJsonWith(ChatAppRemote.fromJsonList);
  }
}
