import 'package:phone_number/phone_number.dart';
import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/home/data/repository/chat_app_repository.dart';
import 'package:zapfy/features/home/domain/repository/chat_app_repository.dart';
import 'package:zapfy/features/home/domain/usecase/get_chat_apps.dart';
import 'package:zapfy/features/home/domain/usecase/get_default_region.dart';
import 'package:zapfy/features/home/domain/usecase/get_region_by_code.dart';
import 'package:zapfy/features/home/domain/usecase/save_phone_number_history.dart';
import 'package:zapfy/features/home/presentation/home_controller.dart';

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
    () => ChatAppRepository(),
  );
}