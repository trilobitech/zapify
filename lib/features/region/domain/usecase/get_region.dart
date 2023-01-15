import '../entity/region.dart';
import '../repository/region_repository.dart';

class GetRegionUseCase {
  GetRegionUseCase({required this.repository});

  IRegionRepository repository;

  Future<Country> call({required String prefix, required String code}) async {
    final regions = await repository.getAll();
    return regions.firstWhere(
      (element) => '${element.prefix}' == prefix && element.code == code,
    );
  }
}

class GetDefaultRegionUseCase {
  GetDefaultRegionUseCase({
    required this.repository,
  });

  IRegionRepository repository;

  Future<IRegion> call() => repository.getCurrent();
}
