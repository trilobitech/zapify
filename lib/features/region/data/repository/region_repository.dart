import 'package:country_codes/country_codes.dart';
import 'package:logify/logify.dart';
import 'package:phone_number/phone_number.dart';

import '../../../../app.dart';
import '../../../../common/config/local_config.dart';
import '../../domain/entity/region.dart';
import '../../domain/repository/region_repository.dart';

class RegionRepository implements IRegionRepository {
  RegionRepository({
    CountryCodesWrapper countryCodesWrapper = const LegacyCountryCodesWrapper(),
  }) : _countryCodesWrapper = countryCodesWrapper;

  final CountryCodesWrapper _countryCodesWrapper;
  List<Country>? _cached;

  late final IRegion _defaultRegion = Region.defaults();

  @override
  Future<List<Country>> getAll() async =>
      _cached ??= await _countryCodesWrapper.all();

  @override
  Future<IRegion> getCurrent() async {
    final code =
        await LocalConfig.defaultRegion.get<String?>() ??
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
      return await _countryCodesWrapper.current();
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

abstract class CountryCodesWrapper {
  const CountryCodesWrapper();

  Future<String> current();

  Future<List<Country>> all();
}

class LegacyCountryCodesWrapper extends CountryCodesWrapper {
  const LegacyCountryCodesWrapper();

  @override
  Future<String> current() async {
    final countryCode =
        (await PhoneNumberUtil().carrierRegionCode()).toUpperCase();
    Log.d('Current country code: $countryCode');
    return countryCode.toUpperCase();
  }

  @override
  Future<List<Country>> all() async {
    return (await PhoneNumberUtil().allSupportedRegions())
      .map(
        (RegionInfo info) =>
            Country(code: info.code, prefix: '${info.prefix}', name: info.name),
      )
      .toList(growable: false)..sort((a, b) => a.name.compareTo(b.name));
  }
}

class NewCountryCodesWrapper extends CountryCodesWrapper {
  const NewCountryCodesWrapper();

  static bool _isInitialized = false;

  Future<void> _initializeIfNeeded() async {
    if (_isInitialized) return;
    await CountryCodes.init(App.currentLocale);
    _isInitialized = true;
  }

  @override
  Future<String> current() async {
    await _initializeIfNeeded();
    final countryCode =
        CountryCodes.getDeviceLocale()?.countryCode ??
        App.currentLocale.countryCode!;
    Log.d('Current country code: $countryCode');
    return countryCode.toUpperCase();
  }

  @override
  Future<List<Country>> all() async {
    await _initializeIfNeeded();
    return CountryCodes.countryCodes()
      .map(
        (e) => Country(
          code: e.alpha2Code!,
          prefix: e.dialCode!.replaceFirst('+', '').trim(),
          name: e.localizedName!,
        ),
      )
      .toList(growable: false)..sort((a, b) => a.name.compareTo(b.name));
  }
}
