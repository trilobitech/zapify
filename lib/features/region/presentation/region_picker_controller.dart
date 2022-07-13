import 'package:zapfy/features/region/domain/get_regions_by_term.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

class RegionPickerController {
  RegionPickerController({
    required this.getAvailableRegions,
  });

  GetRegionsByTermUseCase getAvailableRegions;

  Future<List<Region>> getRegionByTerm(String term) =>
      getAvailableRegions(term);

  Future<List<Region>> getAllRegions() => getAvailableRegions('');
}
