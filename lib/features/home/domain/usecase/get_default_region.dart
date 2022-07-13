import 'package:zapfy/features/shared/domain/entity/region.dart';
import 'package:zapfy/features/shared/domain/repository/region_repository.dart';

class GetDefaultRegionUseCase {
  GetDefaultRegionUseCase({
    required this.repository,
  });

  IRegionRepository repository;

  Future<Region> call() => repository.getCurrent();
}
