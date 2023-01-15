import '../entity/chat_app.dart';
import '../repository/chat_app_repository.dart';

class GetChatAppsUseCase {
  GetChatAppsUseCase({
    required this.repository,
  });

  IChatAppRepository repository;

  Stream<List<ChatApp>> call() => repository.getAll();
}
