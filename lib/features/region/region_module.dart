import 'package:zapify/core/di/definition.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/features/region/domain/get_regions_by_term.dart';
import 'package:zapify/features/region/presentation/region_picker_controller.dart';

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
