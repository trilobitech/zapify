import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'data/datasource/chat_app_datasource.dart';
import 'data/datasource/impl/chat_app_datasource_local.dart';
import 'data/datasource/impl/chat_app_datasource_remote.dart';
import 'data/repository/chat_app_repository.dart';
import 'domain/repository/chat_app_repository.dart';
import 'domain/usecase/app_review.dart';
import 'domain/usecase/get_chat_apps.dart';
import 'domain/usecase/get_region.dart';
import 'domain/usecase/get_top_banner.dart';
import 'domain/usecase/save_phone_number_history.dart';
import 'presentation/home_controller.dart';

void homeModule() {
  registerFactory(
    () => HomeController(
      plugin: get(),
      getDefaultRegion: get(),
      getRegion: get(),
      getChatApps: get(),
      savePhoneNumberHistory: get(),
      getTopBanner: get(),
      setLastAppReviewAtNow: get(),
    ),
  );

  registerFactory(
    () => GetTopBannerUseCase(
      canAskForReview: get(),
    ),
  );

  registerFactory(
    () => CanAskForReview(),
  );

  registerFactory(
    () => SetLastAppReviewAtNow(),
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
    () => GetRegionUseCase(
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
