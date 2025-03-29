import 'package:analytics/analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zapify/features/region/domain/entity/region.dart';
import 'package:zapify/features/region/domain/usecase/get_regions_by_term.dart';
import 'package:zapify/features/region/presentation/region_picker_bloc.dart';
import 'package:zapify/features/region/presentation/region_picker_state.dart';

class MockGetRegionsByTermUseCase extends Mock implements GetRegionsByTermUseCase {}

class MockAnalytics extends Mock implements IAnalytics {}

void main() {
  late RegionPickerBloc regionPickerBloc;

  late GetRegionsByTermUseCase mockGetRegionsByTermUseCase;
  late IAnalytics mockAnalytics;

  const term = 'Brazil';
  final brazil = Country(code: 'BR', prefix: 55, name: 'Brazil');
  final countries = [
    brazil,
    Country(code: 'GB', prefix: 44, name: 'United Kingdom'),
    Country(code: 'US', prefix: 1, name: 'United States'),
  ];

  setUp(() {
    mockGetRegionsByTermUseCase = MockGetRegionsByTermUseCase();
    mockAnalytics = MockAnalytics();

    regionPickerBloc = RegionPickerBloc(getAvailableRegions: mockGetRegionsByTermUseCase, analytics: mockAnalytics);

    when(() => mockGetRegionsByTermUseCase(term: term)).thenAnswer((_) async => [brazil]);

    when(() => mockGetRegionsByTermUseCase()).thenAnswer((_) async => countries);
  });

  test('initial state should be RegionPickerState.initial()', () {
    expect(regionPickerBloc.currentState, RegionPickerState(countries: List.generate(20, (_) => ShimmerCountry())));
  });

  test('state should be RegionPickerState() when load', () {
    expectLater(regionPickerBloc.stream, emits(RegionPickerState(countries: countries)));
  });

  group('fetchRegionsByTerm', () {
    test('should call GetRegionsByTermUseCase with term "$term"', () async {
      regionPickerBloc.fetchRegionsByTerm(term);

      verify(() => mockGetRegionsByTermUseCase(term: term)).called(1);
    });

    test('should update state with countries filtered by term "$term"', () async {
      regionPickerBloc.fetchRegionsByTerm(term);

      expect(regionPickerBloc.stream, emits(RegionPickerState(countries: [brazil])));
    });
  });

  group('select', () {
    final country = brazil;

    test('should call analytics.itemSelected with the selected country properties', () async {
      regionPickerBloc.select(country);

      verify(
        () => mockAnalytics.itemSelected('region', properties: {'region_selected': 'Brazil', 'region_prefix': '55'}),
      ).called(1);
    });

    test('should send a RegionPickerAction.close action with the selected country', () async {
      expectLater(regionPickerBloc.stream, emits(RegionPickerAction.close(brazil)));

      regionPickerBloc.select(country);
    });
  });

  test('dismiss should send a RegionPickerAction.close action without a country', () {
    expectLater(regionPickerBloc.stream, emits(RegionPickerAction.close()));

    regionPickerBloc.dismiss();
  });
}
