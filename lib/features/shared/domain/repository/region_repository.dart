import '../entity/region.dart';

abstract class IRegionRepository {
  Future<List<Region>> getAll();

  Future<Region> getCurrent();
}
