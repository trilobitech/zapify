import 'package:zapify/features/shared/domain/entity/region.dart';
import 'package:zapify/features/shared/domain/repository/region_repository.dart';

class GetDefaultRegionUseCase {
  GetDefaultRegionUseCase({
    required this.repository,
  });

  IRegionRepository repository;

  Future<Region> call() => repository.getCurrent();
}
