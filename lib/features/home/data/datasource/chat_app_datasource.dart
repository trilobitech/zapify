import 'package:zapfy/features/home/data/model/chat_app_remote.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';

abstract class ChatAppDataSource {}

abstract class ChatAppDataSourceLocal implements ChatAppDataSource {
  Stream<List<ChatApp>> get();

  Future<void> syncWith(List<ChatApp> chatApps);
}

abstract class ChatAppDataSourceRemote implements ChatAppDataSource {
  Future<List<ChatAppRemote>> get();
}
