import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zapify/features/region/domain/entity/region.dart';
import 'package:zapify/features/region/domain/repository/region_repository.dart';
import 'package:zapify/features/region/domain/usecase/get_default_region.dart';

class MockRegionRepository extends Mock implements IRegionRepository {}

class MockRegion extends Mock implements IRegion {}

void main() {
  late GetDefaultRegionUseCase useCase;
  late IRegionRepository repository;
  late IRegion defaultRegion;

  setUp(() {
    repository = MockRegionRepository();
    defaultRegion = MockRegion();

    useCase = GetDefaultRegionUseCase(repository: repository);
  });

  test('should get the default region from repository', () async {
    when(() => repository.getCurrent()).thenAnswer((_) async => defaultRegion);

    final result = await useCase();

    expect(result, equals(defaultRegion));
    verify(() => repository.getCurrent()).called(1);
  });
}
