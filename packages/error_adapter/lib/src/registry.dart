import 'package:meta/meta.dart';

import 'converter.dart';

abstract class ErrorConverterRegistry {
  final _converters = <ErrorConverterWrapper>[];

  @protected
  @nonVirtual
  void on<T>(ErrorConverter converter) {
    final converterExists = _converters.any((handler) => handler.type == T);

    if (converterExists) {
      throw StateError(
        'on<$T> was called multiple times. '
        'There should only be a single error converter per error type.',
      );
    }

    _converters.add(
      ErrorConverterWrapper(
        type: T,
        canConvert: (value) => value is T,
        convert: converter,
      ),
    );
  }

  bool hasConverterFor(Object error) =>
      _converters.any((el) => el.canConvert(error));

  ErrorConverter getConverterFor(Object error) =>
      _converters.firstWhere((el) => el.canConvert(error)).convert;
}

class ErrorConverterRegistryComposite extends ErrorConverterRegistry {
  ErrorConverterRegistryComposite(
    this._registries,
  );

  final Iterable<ErrorConverterRegistry> _registries;

  @override
  bool hasConverterFor(Object error) =>
      _registries.any((el) => el.hasConverterFor(error));

  @override
  ErrorConverter getConverterFor(Object error) => _registries
      .firstWhere((el) => el.hasConverterFor(error))
      .getConverterFor(error);
}
