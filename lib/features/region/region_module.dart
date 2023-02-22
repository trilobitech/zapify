import '../../common/di/definition.dart';
import 'data/repository/region_repository.dart';
import 'domain/repository/region_repository.dart';
import 'domain/usecase/get_default_region.dart';
import 'domain/usecase/get_regions_by_term.dart';
import 'presentation/region_picker_bloc.dart';

void regionModule() {
  registerFactory(
    () => RegionPickerBloc(
      getAvailableRegions: get(),
      analytics: get(),
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

  registerSingleton<IRegionRepository>(
    () => RegionRepository(
      plugin: get(),
    ),
  );
}
