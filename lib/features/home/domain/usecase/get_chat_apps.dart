import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/repository/chat_app_repository.dart';

class GetChatAppsUseCase {
  GetChatAppsUseCase({
    required this.repository,
  });

  IChatAppRepository repository;

  Future<List<ChatApp>> call() => repository.getAll();
}
