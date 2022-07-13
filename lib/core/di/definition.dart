import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

late final registerFactory = getIt.registerFactory;

late final registerSingleton = getIt.registerLazySingleton;
