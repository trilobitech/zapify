import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'domain/get_regions_by_term.dart';
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
}
