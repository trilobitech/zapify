import '../model/chat_app.dart';

abstract class IChatAppDataSource {
  Stream<List<ChatAppModel>> get();
}
