import '../../domain/entity/chat_app.dart';
import '../model/chat_app_local.dart';
import '../model/chat_app_remote.dart';

abstract class ChatAppDataSource {}

abstract class ChatAppDataSourceLocal implements ChatAppDataSource {
  Stream<List<ChatAppLocal>> get();

  Future<void> syncWith(List<ChatApp> chatApps);
}

abstract class ChatAppDataSourceRemote implements ChatAppDataSource {
  Future<List<ChatAppRemote>> get();
}
