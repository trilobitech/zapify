import 'package:flutter_test/flutter_test.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phone_number/phone_number.dart';
import 'package:zapify/features/region/data/repository/region_repository.dart';
import 'package:zapify/features/region/domain/entity/region.dart';

class MockPhoneNumberUtil extends Mock implements PhoneNumberUtil {}

void main() {
  late RegionRepository regionRepository;
  late MockPhoneNumberUtil mockPhoneNumberUtil;

  final defaultRegion = Region(code: 'BR', prefix: 55);

  const regions = [
    RegionInfo(name: 'Brazil', code: 'BR', prefix: 55),
    RegionInfo(name: 'United States', code: 'US', prefix: 1),
    RegionInfo(name: 'Mexico', code: 'MX', prefix: 52),
    RegionInfo(name: 'Canada', code: 'CA', prefix: 1),
    RegionInfo(name: 'Argentina', code: 'AR', prefix: 54),
    RegionInfo(name: 'India', code: 'IN', prefix: 91),
    RegionInfo(name: 'United Kingdom', code: 'UK', prefix: 44),
    RegionInfo(name: 'Colombia', code: 'CO', prefix: 57),
  ];

  final countries = [
    Country(name: 'Argentina', code: 'AR', prefix: 54),
    Country(name: 'Brazil', code: 'BR', prefix: 55),
    Country(name: 'Canada', code: 'CA', prefix: 1),
    Country(name: 'Colombia', code: 'CO', prefix: 57),
    Country(name: 'India', code: 'IN', prefix: 91),
    Country(name: 'Mexico', code: 'MX', prefix: 52),
    Country(name: 'United Kingdom', code: 'UK', prefix: 44),
    Country(name: 'United States', code: 'US', prefix: 1),
  ];

  setUp(() {
    mockPhoneNumberUtil = MockPhoneNumberUtil();
    regionRepository = RegionRepository(plugin: mockPhoneNumberUtil);
    Log.plant(null);
  });

  test(
    'getAll returns list of countries sorted by name',
    () async {
      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      final result = await regionRepository.getAll();

      expect(result, equals(countries));
    },
  );

  test(
    'getCurrent returns default region if carrier region code is invalid',
    () async {
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => 'invalid code');

      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      final result = await regionRepository.getCurrent();

      expect(result, equals(defaultRegion));
    },
  );

  test(
    'getCurrent returns correct region for carrier region code',
    () async {
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => 'MX');

      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      final result = await regionRepository.getCurrent();

      expect(result, equals(countries[5]));
    },
  );

  test(
    'getCurrent should return default region when carrierRegionCode fails',
    () async {
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => throw 'Failed to get carrier region code');

      final result = await regionRepository.getCurrent();

      expect(result, equals(defaultRegion));
    },
  );
}
