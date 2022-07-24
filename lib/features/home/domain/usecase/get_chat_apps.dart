import 'package:zapify/features/home/domain/entity/chat_app.dart';
import 'package:zapify/features/home/domain/repository/chat_app_repository.dart';

class GetChatAppsUseCase {
  GetChatAppsUseCase({
    required this.repository,
  });

  IChatAppRepository repository;

  Stream<List<ChatApp>> call() => repository.getAll();
}
