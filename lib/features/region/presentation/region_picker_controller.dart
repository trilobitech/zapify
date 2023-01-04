import '../domain/entity/region.dart';
import '../domain/usecase/get_regions_by_term.dart';

class RegionPickerController {
  RegionPickerController({
    required this.getAvailableRegions,
  });

  GetRegionsByTermUseCase getAvailableRegions;

  Future<List<Region>> getRegionByTerm(String term) =>
      getAvailableRegions(term);

  Future<List<Region>> getAllRegions() => getAvailableRegions('');
}
