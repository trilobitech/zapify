import '../entity/region.dart';

abstract class IRegionRepository {
  Future<List<Country>> getAll();

  Future<IRegion> getCurrent();

  Future<void> setCurrent(IRegion region);
}
