import '../model/chat_app_local.dart';

abstract class ChatAppDataSource {
  Stream<List<ChatAppLocal>> get();
}
