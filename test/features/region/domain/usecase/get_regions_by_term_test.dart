import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zapify/features/region/domain/entity/region.dart';
import 'package:zapify/features/region/domain/repository/region_repository.dart';
import 'package:zapify/features/region/domain/usecase/get_regions_by_term.dart';

class MockRegionRepository extends Mock implements IRegionRepository {}

void main() {
  late IRegionRepository repository;
  late GetRegionsByTermUseCase useCase;

  final regions = [
    Country(code: 'BR', prefix: '55', name: 'Brazil'),
    Country(code: 'AR', prefix: '54', name: 'Argentina'),
    Country(code: 'CO', prefix: '57', name: 'Colombia'),
    Country(code: 'US', prefix: '1', name: 'United States'),
    Country(code: 'CA', prefix: '1', name: 'Canada'),
    Country(code: 'PT', prefix: '351', name: 'Portugal'),
    Country(code: 'UK', prefix: '44', name: 'United Kingdom'),
  ];

  setUp(() {
    repository = MockRegionRepository();
    useCase = GetRegionsByTermUseCase(repository: repository);

    when(() => repository.getAll()).thenAnswer((_) async => regions);
  });

  group('GetRegionsByTermUseCase', () {
    test('should return all regions if term is empty', () async {
      // act
      final result = await useCase.call(term: '');

      // assert
      expect(result, equals(regions));
      verify(() => repository.getAll()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return only countries with matching code or name', () async {
      // arrange
      final expectedCountries = [
        Country(code: 'US', prefix: '1', name: 'United States'),
        Country(code: 'PT', prefix: '351', name: 'Portugal'),
        Country(code: 'UK', prefix: '44', name: 'United Kingdom'),
      ];

      // act
      final result = await useCase.call(term: 'U');

      // assert
      expect(result, equals(expectedCountries));
      verify(() => repository.getAll()).called(1);
    });

    test('should filter regions case insensitive', () async {
      // arrange
      final expected = [Country(code: 'CA', prefix: '1', name: 'Canada')];

      // act
      final result = await useCase.call(term: 'nAdA');

      // assert
      expect(result, equals(expected));
      verify(() => repository.getAll()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return an empty list if no regions match the term', () async {
      // act
      final result = await useCase.call(term: 'xyz');

      // assert
      expect(result, isEmpty);
      verify(() => repository.getAll()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return regions whose prefix contains the term', () async {
      // arrange
      const term = '5';
      final expectedRegions = [
        Country(code: 'BR', prefix: '55', name: 'Brazil'),
        Country(code: 'AR', prefix: '54', name: 'Argentina'),
        Country(code: 'CO', prefix: '57', name: 'Colombia'),
        Country(code: 'PT', prefix: '351', name: 'Portugal'),
      ];

      // act
      final regions = await useCase.call(term: term);

      // assert
      expect(regions, expectedRegions);
    });
  });
}
