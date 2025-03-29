import 'package:meta/meta.dart';

import '../entity/region.dart';
import '../repository/region_repository.dart';

@immutable
class GetDefaultRegionUseCase {
  const GetDefaultRegionUseCase({required IRegionRepository repository}) : _repository = repository;

  final IRegionRepository _repository;

  Future<IRegion> call() => _repository.getCurrent();
}
