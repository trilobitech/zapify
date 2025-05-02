import 'package:meta/meta.dart';

import '../entity/region.dart';
import '../repository/region_repository.dart';

@immutable
class GetRegionsByTermUseCase {
  const GetRegionsByTermUseCase({required IRegionRepository repository})
    : _repository = repository;

  final IRegionRepository _repository;

  Future<List<Country>> call({String term = ''}) async {
    term = term.trim().toLowerCase();
    final countries = await _repository.getAll();
    if (term.isEmpty) {
      return countries;
    }

    return countries
        .where((country) {
          final identifier = '${country.code.toLowerCase()} +${country.prefix}';
          return identifier.contains(term) ||
              country.name.toLowerCase().contains(term);
        })
        .toList(growable: false);
  }
}
