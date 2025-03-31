import 'entity/chat_app.dart';
import 'repository/chat_app_repository.dart';

class DisableChatAppUseCase {
  const DisableChatAppUseCase({required IChatAppRepository repository})
    : _repository = repository;

  final IChatAppRepository _repository;

  Future<void> call(ChatApp chatApp) => _repository.disable(chatApp);
}
