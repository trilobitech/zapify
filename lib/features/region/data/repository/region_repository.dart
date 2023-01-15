import 'package:logger_plus/logger_plus.dart';
import 'package:phone_number/phone_number.dart' hide RegionInfo;

import '../../domain/entity/region.dart';
import '../../domain/repository/region_repository.dart';

class RegionRepository implements IRegionRepository {
  RegionRepository({required PhoneNumberUtil plugin}) : _plugin = plugin;

  final PhoneNumberUtil _plugin;
  List<Country>? _cached;

  @override
  Future<List<Country>> getAll() async {
    return _cached ??= (await _plugin.allSupportedRegions())
        .map(
          (info) => Country(
            code: info.code,
            prefix: info.prefix,
            name: info.name,
          ),
        )
        .toList(growable: false)
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Future<IRegion> getCurrent() async {
    final defaultRegion = RegionInfo.defaults();

    final code = await _plugin
        .carrierRegionCode()
        .then((value) => value.toUpperCase())
        .catchError((e, stack) {
      Log.e(e, stack);
      return defaultRegion.code;
    });

    final allRegions = await getAll();
    return allRegions.whereType<IRegion>().firstWhere(
          (element) => element.code == code,
          orElse: () => defaultRegion,
        );
  }
}
