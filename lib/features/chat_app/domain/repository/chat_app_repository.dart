import '../entity/chat_app.dart';

abstract class IChatAppRepository {
  Stream<Iterable<ChatApp>> getAll();

  Future<void> disable(ChatApp chatApp);

  Future<void> enable(ChatApp chatApp);
}
