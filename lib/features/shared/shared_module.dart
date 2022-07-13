import 'package:phone_number/phone_number.dart';
import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/shared/data/repository/history_repository.dart';
import 'package:zapfy/features/shared/data/repository/region_repository.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';
import 'package:zapfy/features/shared/domain/repository/region_repository.dart';

void sharedModule() {
  registerSingleton(() => PhoneNumberUtil());

  registerSingleton<IHistoryRepository>(
    () => HistoryRepository(),
  );

  registerSingleton<IRegionRepository>(
    () => RegionRepository(
      plugin: get(),
    ),
  );
}
