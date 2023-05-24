import '../../common/di/definition.dart';
import 'data/datasource/chat_app_datasource.dart';
import 'data/datasource/impl/chat_app_datasource.dart';
import 'data/repository/chat_app_repository.dart';
import 'domain/get_disabled_chat_apps.dart';
import 'domain/get_enabled_chat_apps.dart';
import 'domain/repository/chat_app_repository.dart';

void chatAppModule() {
  registerFactory(
    () => GetEnabledChatAppsUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => GetDisabledChatAppsUseCase(
      repository: get(),
    ),
  );

  registerFactory<IChatAppRepository>(
    () => ChatAppRepository(
      dataSource: get(),
    ),
  );

  registerSingleton<IChatAppDataSource>(
    () => ChatAppDataSource(
      db: lazy(),
    ),
  );
}
