import 'package:http/http.dart';
import 'package:zapfy/config/remote_config.dart';
import 'package:zapfy/core/data/network/ext.dart';
import 'package:zapfy/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapfy/features/home/data/model/chat_app_remote.dart';

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
