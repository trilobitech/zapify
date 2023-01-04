import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'data/datasource/chat_app_datasource.dart';
import 'data/datasource/impl/chat_app_datasource_local.dart';
import 'data/datasource/impl/chat_app_datasource_remote.dart';
import 'data/repository/chat_app_repository.dart';
import 'domain/repository/chat_app_repository.dart';
import 'domain/usecase/get_chat_apps.dart';

void chatAppsModule() {
  registerFactory(
    () => GetChatAppsUseCase(
      repository: get(),
    ),
  );

  registerFactory<IChatAppRepository>(
    () => ChatAppRepository(
      localDataSource: get(),
      remoteDataSource: get(),
    ),
  );

  registerFactory<ChatAppDataSourceLocal>(
    () => ChatAppDataSourceLocalImpl(
      db: get(),
    ),
  );

  registerFactory<ChatAppDataSourceRemote>(
    () => ChatAppDataSourceRemoteImpl(
      httpClient: get(),
    ),
  );
}
