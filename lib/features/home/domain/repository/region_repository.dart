import 'package:zapfy/features/home/domain/entity/region.dart';

abstract class IRegionRepository {
  Future<List<Region>> getAll();
}
