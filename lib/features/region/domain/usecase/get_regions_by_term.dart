import '../entity/region.dart';
import '../repository/region_repository.dart';

class GetRegionsByTermUseCase {
  GetRegionsByTermUseCase({
    required this.repository,
  });

  IRegionRepository repository;

  Future<List<Region>> call(String term) async {
    term = term.trim();
    final regions = await repository.getAll();
    if (term.isEmpty) {
      return regions;
    }

    return regions.where(
      (elt) {
        return elt.code.toUpperCase().contains(term.toUpperCase()) ||
            elt.prefix.toString().contains(term) ||
            elt.name.toLowerCase().startsWith(term.toLowerCase());
      },
    ).toList(growable: false);
  }
}
