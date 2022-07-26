import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final registerFactory = getIt.registerFactory;

final registerSingletonAsync = getIt.registerSingletonAsync;

void registerSingleton<T extends Object>(
  FactoryFunc<T> factoryFunc, {
  Iterable<Type>? dependsOn,
  DisposingFunc<T>? dispose,
}) {
  if (dependsOn?.isNotEmpty == true) {
    return getIt.registerSingletonWithDependencies(
      factoryFunc,
      dependsOn: dependsOn,
      dispose: dispose,
    );
  }
  return getIt.registerLazySingleton(factoryFunc, dispose: dispose);
}
