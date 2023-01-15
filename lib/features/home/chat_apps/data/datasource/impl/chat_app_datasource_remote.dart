import 'package:http/http.dart';
import 'package:http_client_plus/http_client_plus.dart';

import '../../../../../../../common/config/remote_config.dart';
import '../../model/chat_app_remote.dart';
import '../chat_app_datasource.dart';

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
