import 'package:zapify/core/di/definition.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/datasource/impl/chat_app_datasource_local.dart';
import 'package:zapify/features/home/data/datasource/impl/chat_app_datasource_remote.dart';
import 'package:zapify/features/home/data/repository/chat_app_repository.dart';
import 'package:zapify/features/home/domain/repository/chat_app_repository.dart';
import 'package:zapify/features/home/domain/usecase/get_chat_apps.dart';
import 'package:zapify/features/home/domain/usecase/get_default_region.dart';
import 'package:zapify/features/home/domain/usecase/get_region_by_code.dart';
import 'package:zapify/features/home/domain/usecase/save_phone_number_history.dart';
import 'package:zapify/features/home/presentation/home_controller.dart';

void homeModule() {
  registerFactory(
    () => HomeController(
      plugin: get(),
      getDefaultRegion: get(),
      getRegionByCode: get(),
      getChatApps: get(),
      savePhoneNumberHistory: get(),
    ),
  );

  registerFactory(
    () => GetChatAppsUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => GetDefaultRegionUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => GetRegionByCode(
      repository: get(),
    ),
  );

  registerFactory(
    () => SavePhoneNumberHistoryUseCase(
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
