import 'entity/chat_app.dart';
import 'repository/chat_app_repository.dart';

class EnableChatAppUseCase {
  const EnableChatAppUseCase({
    required IChatAppRepository repository,
  }) : _repository = repository;

  final IChatAppRepository _repository;

  Future<void> call(ChatApp chatApp) => _repository.enable(chatApp);
}
