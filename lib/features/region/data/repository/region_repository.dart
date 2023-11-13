import 'package:config/config.dart';
import 'package:logify/logify.dart';
import 'package:phone_number/phone_number.dart';

import '../../domain/entity/region.dart';
import '../../domain/repository/region_repository.dart';

class RegionRepository implements IRegionRepository {
  RegionRepository({required PhoneNumberUtil plugin}) : _plugin = plugin;

  final PhoneNumberUtil _plugin;
  List<Country>? _cached;

  late final IRegion _defaultRegion = Region.defaults();

  @override
  Future<List<Country>> getAll() async {
    return _cached ??= (await _plugin.allSupportedRegions())
        .map(
          (RegionInfo info) => Country(
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
    final code = await LocalConfig.defaultRegion.get<String?>() ??
        await _carrierRegionCode();

    if (code == _defaultRegion.code) return _defaultRegion;

    final allRegions = (await getAll()).cast<IRegion>();

    return allRegions.firstWhere(
      (region) => region.code == code,
      orElse: () => _defaultRegion,
    );
  }

  Future<String> _carrierRegionCode() async {
    try {
      return (await _plugin.carrierRegionCode()).toUpperCase();
    } catch (e, stack) {
      Log.e(e, stack);
      return _defaultRegion.code;
    }
  }

  @override
  Future<void> setCurrent(IRegion region) async {
    await LocalConfig.defaultRegion.set(region.code);
  }
}
