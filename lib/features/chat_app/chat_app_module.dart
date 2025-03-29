import '../../common/di/definition.dart';
import 'data/datasource/chat_app_datasource.dart';
import 'data/datasource/impl/chat_app_datasource.dart';
import 'data/repository/chat_app_repository.dart';
import 'domain/disable_chat_app.dart';
import 'domain/enable_chat_app.dart';
import 'domain/get_disabled_chat_apps.dart';
import 'domain/get_enabled_chat_apps.dart';
import 'domain/repository/chat_app_repository.dart';
import 'presentation/chat_app_bloc.dart';

void chatAppModule() {
  registerFactory(
    () =>
        ChatAppBloc(getEnabledChatApps: get(), getDisabledChatApps: get(), disableChatApp: get(), enableChatApp: get()),
  );

  registerFactory(() => GetEnabledChatAppsUseCase(repository: get()));

  registerFactory(() => GetDisabledChatAppsUseCase(repository: get()));

  registerFactory(() => DisableChatAppUseCase(repository: get()));

  registerFactory(() => EnableChatAppUseCase(repository: get()));

  registerFactory<IChatAppRepository>(() => ChatAppRepository(dataSource: get()));

  registerSingleton<IChatAppDataSource>(() => ChatAppDataSource(db: lazy()));
}
