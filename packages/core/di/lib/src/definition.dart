import 'package:get_it/get_it.dart';

import 'inject.dart' show getIt;

export 'inject.dart' show get, lazyGet;
export 'lazy.dart' show lazy;

final registerFactory = getIt.registerFactory;

final registerFactoryParam = getIt.registerFactoryParam;

final registerSingletonAsync = getIt.registerSingletonAsync;

final registerLazySingleton = getIt.registerLazySingletonAsync;

final allReady = getIt.allReady;

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
