import 'entity/chat_app.dart';
import 'repository/chat_app_repository.dart';

class GetDisabledChatAppsUseCase {
  const GetDisabledChatAppsUseCase({required IChatAppRepository repository})
    : _repository = repository;

  final IChatAppRepository _repository;

  Stream<Iterable<ChatApp>> call() => _repository.getAll().map(
    (actions) => actions.skipWhile((action) => action.isEnabled),
  );
}
