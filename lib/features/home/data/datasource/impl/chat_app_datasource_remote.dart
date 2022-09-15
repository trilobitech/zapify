import 'package:http/http.dart';
import 'package:http_client_plus/http_client_plus.dart';
import 'package:zapify/config/remote_config.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/model/chat_app_remote.dart';

class ChatAppDataSourceRemoteImpl implements ChatAppDataSourceRemote {
  ChatAppDataSourceRemoteImpl({
    required this.httpClient,
  });

  final Client httpClient;

  @override
  Future<List<ChatAppRemote>> get() async {
    final String sourceUrl = await RemoteConfig.chatAppsSourceUrl.get();

    return httpClient
        .get(Uri.parse(sourceUrl))
        .mapJsonWith(ChatAppRemote.fromJsonList);
  }
}
