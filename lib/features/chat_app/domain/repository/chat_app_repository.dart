import '../entity/chat_app.dart';

abstract class IChatAppRepository {
  Stream<Iterable<ChatApp>> getAll();
}
