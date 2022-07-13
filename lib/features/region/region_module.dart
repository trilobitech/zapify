import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/region/domain/get_regions_by_term.dart';
import 'package:zapfy/features/region/presentation/region_picker_controller.dart';

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
