import 'entity/chat_app.dart';
import 'repository/chat_app_repository.dart';

class GetEnabledChatAppsUseCase {
  const GetEnabledChatAppsUseCase({required IChatAppRepository repository}) : _repository = repository;

  final IChatAppRepository _repository;

  Stream<Iterable<ChatApp>> call() =>
      _repository.getAll().map((actions) => actions.takeWhile((action) => action.isEnabled));
}
