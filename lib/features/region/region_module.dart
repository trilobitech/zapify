import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'data/repository/region_repository.dart';
import 'domain/repository/region_repository.dart';
import 'domain/usecase/get_region.dart';
import 'domain/usecase/get_regions_by_term.dart';
import 'presentation/region_picker_controller.dart';

void regionModule() {
  registerFactory(
    () => RegionPickerController(
      getAvailableRegions: get(),
    ),
  );

  registerFactory(
    () => GetRegionsByTermUseCase(
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

  registerSingleton<IRegionRepository>(
    () => RegionRepository(
      plugin: get(),
    ),
  );
}
