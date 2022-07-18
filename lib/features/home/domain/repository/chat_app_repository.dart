import 'package:zapfy/features/home/domain/entity/chat_app.dart';

abstract class IChatAppRepository {
  Stream<List<ChatApp>> getAll();
}
