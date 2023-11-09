import 'package:config_core/config_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:phone_number/phone_number.dart';
import 'package:zapify/common/config/local_config.dart';
import 'package:zapify/features/region/data/repository/region_repository.dart';
import 'package:zapify/features/region/domain/entity/region.dart';

class MockPhoneNumberUtil extends Mock implements PhoneNumberUtil {}

class MockLocalConfigStorage extends Mock implements ILocalConfigStorage {}

void main() {
  late RegionRepository regionRepository;
  late MockPhoneNumberUtil mockPhoneNumberUtil;
  late ILocalConfigStorage mockLocalConfigStorage;

  final defaultRegion = Region(code: 'BR', prefix: 55);

  const regions = [
    RegionInfo(name: 'Canada', code: 'CA', prefix: 1),
    RegionInfo(name: 'Brazil', code: 'BR', prefix: 55),
    RegionInfo(name: 'Mali', code: 'ML', prefix: 223),
    RegionInfo(name: 'Mexico', code: 'MX', prefix: 52),
    RegionInfo(name: 'Argentina', code: 'AR', prefix: 54),
    RegionInfo(name: 'India', code: 'IN', prefix: 91),
    RegionInfo(name: 'United Kingdom', code: 'UK', prefix: 44),
    RegionInfo(name: 'Colombia', code: 'CO', prefix: 57),
  ];

  final countries = regions
      .map(
        (e) => Country(
          code: e.code,
          prefix: e.prefix,
          name: e.name,
        ),
      )
      .toList(growable: false)
    ..sort((a, b) => a.name.compareTo(b.name));

  setUpAll(() {
    GetIt.instance.registerFactoryAsync<ILocalConfigStorage>(
      () async => mockLocalConfigStorage,
    );
  });

  setUp(() {
    mockPhoneNumberUtil = MockPhoneNumberUtil();
    mockLocalConfigStorage = MockLocalConfigStorage();
    regionRepository = RegionRepository(plugin: mockPhoneNumberUtil);

    when(
      () => mockLocalConfigStorage
          .getValue<String?>(LocalConfig.defaultRegion.key),
    ).thenReturn(null);
  });

  test(
    'getAll returns list of countries sorted by name',
    () async {
      // arrange
      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      // act
      final result = await regionRepository.getAll();

      // assert
      expect(result, equals(countries));
    },
  );

  test(
    'getCurrent returns default region if carrier region code is invalid',
    () async {
      // arrange
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => 'invalid code');

      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      // act
      final result = await regionRepository.getCurrent();

      // assert
      expect(result, equals(defaultRegion));
    },
  );

  test(
    'getCurrent returns correct region for carrier region code',
    () async {
      // arrange
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => 'MX');

      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      // act
      final result = await regionRepository.getCurrent();

      // assert
      expect(result, equals(countries[6]));
    },
  );

  test(
    'getCurrent should return default region when carrierRegionCode fails',
    () async {
      // arrange
      when(() => mockPhoneNumberUtil.carrierRegionCode())
          .thenAnswer((_) async => throw 'Failed to get carrier region code');

      // act
      final result = await regionRepository.getCurrent();

      // assert
      expect(result, equals(defaultRegion));
    },
  );

  test(
    'getCurrent should return stored region when exists',
    () async {
      // arrange
      when(
        () => mockLocalConfigStorage
            .getValue<String?>(LocalConfig.defaultRegion.key),
      ).thenReturn('CO');

      when(() => mockPhoneNumberUtil.allSupportedRegions())
          .thenAnswer((_) async => regions);

      // act
      final result = await regionRepository.getCurrent();

      // assert
      expect(result, equals(countries[3]));
    },
  );

  test(
    'setCurrent should store region code',
    () async {
      // arrange
      when(
        () => mockLocalConfigStorage.setValue(
          LocalConfig.defaultRegion.key,
          any<String>(),
        ),
      ).thenAnswer((_) async {});

      // act
      await regionRepository.setCurrent(countries[3]);

      // assert
      verify(
        () => mockLocalConfigStorage.setValue(
          LocalConfig.defaultRegion.key,
          countries[3].code,
        ),
      ).called(1);
    },
  );
}
