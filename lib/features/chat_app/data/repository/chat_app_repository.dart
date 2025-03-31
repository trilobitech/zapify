import '../../domain/entity/chat_app.dart';
import '../../domain/repository/chat_app_repository.dart';
import '../datasource/chat_app_datasource.dart';

class ChatAppRepository extends IChatAppRepository {
  ChatAppRepository({required IChatAppDataSource dataSource})
    : _dataSource = dataSource;

  final IChatAppDataSource _dataSource;

  @override
  Stream<Iterable<ChatApp>> getAll() => _dataSource.get();

  @override
  Future<void> disable(ChatApp chatApp) => _dataSource.remove(chatApp);

  @override
  Future<void> enable(ChatApp chatApp) => _dataSource.add(chatApp);
}
