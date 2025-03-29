import 'package:meta/meta.dart';

import '../entity/region.dart';
import '../repository/region_repository.dart';

@immutable
class SetDefaultRegionUseCase {
  const SetDefaultRegionUseCase({required IRegionRepository repository}) : _repository = repository;

  final IRegionRepository _repository;

  Future<void> call(IRegion region) => _repository.setCurrent(region);
}
