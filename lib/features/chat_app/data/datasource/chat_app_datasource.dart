import '../../domain/entity/chat_app.dart';
import '../model/chat_app.dart';

abstract class IChatAppDataSource {
  Stream<List<ChatAppModel>> get();

  Future<void> add(ChatApp chatApp);

  Future<void> remove(ChatApp chatApp);
}
