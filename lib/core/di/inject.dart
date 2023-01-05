import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

T get<T extends Object>({
  dynamic param1,
  dynamic param2,
}) =>
    getIt.get<T>(param1: param1, param2: param2);

Future<T> lazyGet<T extends Object>() => getIt.getAsync<T>();

extension StatefulDiExt<S extends StatefulWidget> on State<S> {
  T inject<T extends Object>() => getIt<T>(param1: context);
}

extension StatelessDiExt on StatelessWidget {
  T inject<T extends Object>() => getIt<T>();
}
