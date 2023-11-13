import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final get = getIt.get;

final lazyGet = getIt.getAsync;

T? getOrNull<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) {
  final instance = getIt.isRegistered<T>(instance: instanceName)
      ? getIt.get<T>(
          instanceName: instanceName,
          param1: param1,
          param2: param2,
        )
      : null;

  return instance;
}

extension StatefulDiExt<S extends StatefulWidget> on State<S> {
  T inject<T extends Object>() => getIt<T>(param1: context);
}

extension StatelessDiExt on StatelessWidget {
  T inject<T extends Object>({
    dynamic param1,
    dynamic param2,
  }) =>
      getIt<T>(param1: param1, param2: param2);
}
