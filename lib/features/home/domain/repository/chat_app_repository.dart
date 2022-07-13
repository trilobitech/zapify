import 'package:zapfy/features/home/domain/entity/chat_app.dart';

abstract class IChatAppRepository {
  Future<List<ChatApp>> getAll();
}
