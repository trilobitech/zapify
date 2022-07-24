import 'package:zapify/features/shared/domain/entity/region.dart';
import 'package:zapify/features/shared/domain/repository/region_repository.dart';

class GetRegionByCode {
  GetRegionByCode({
    required this.repository,
  });

  IRegionRepository repository;

  Future<Region> call(String code) async {
    final regions = await repository.getAll();
    return regions.firstWhere((element) => '${element.prefix}' == code);
  }
}
