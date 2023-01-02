import '../entity/chat_app.dart';

abstract class IChatAppRepository {
  Stream<List<ChatApp>> getAll();
}
