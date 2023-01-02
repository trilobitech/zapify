import 'package:phone_number/phone_number.dart';

import '../../domain/entity/region.dart';
import '../../domain/repository/region_repository.dart';

class RegionRepository implements IRegionRepository {
  RegionRepository({required this.plugin});

  PhoneNumberUtil plugin;
  List<Region> _regions = [];

  @override
  Future<List<Region>> getAll() async {
    if (_regions.isEmpty) {
      final regions = await plugin.allSupportedRegions();

      _regions = regions
          .map((e) => Region(e.code, e.prefix, e.name))
          .toList(growable: false);

      _regions.sort((a, b) => a.name.compareTo(b.name));
    }
    return _regions;
  }

  @override
  Future<Region> getCurrent() async {
    final code =
        await plugin.carrierRegionCode().then((value) => value.toUpperCase());

    final allRegions = await getAll();
    return allRegions.firstWhere(
      (element) => element.code == code,
      orElse: () => Region.br(),
    );
  }
}
