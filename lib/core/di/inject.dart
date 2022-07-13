import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

T inject<T extends Object>() => getIt<T>();

T get<T extends Object>() => getIt<T>();
