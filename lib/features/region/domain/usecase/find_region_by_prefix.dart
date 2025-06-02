import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../entity/region.dart';
import '../repository/region_repository.dart';

@immutable
class FindRegionByPrefixUseCase {
  const FindRegionByPrefixUseCase({required IRegionRepository repository})
    : _repository = repository;

  final IRegionRepository _repository;

  Future<Country?> call(CountryCode prefix) async {
    final countries = await _repository.getAll();
    return countries.firstWhereOrNull((e) => e.prefix == prefix);
  }
}
