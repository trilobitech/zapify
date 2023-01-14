import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'failure.dart';

typedef CanConvert = bool Function(dynamic value);
typedef ErrorConverter = Failure Function(BuildContext context, Object error);

@internal
class ErrorConverterWrapper {
  ErrorConverterWrapper({
    required this.type,
    required this.canConvert,
    required this.convert,
  });

  final Type type;
  final CanConvert canConvert;
  final ErrorConverter convert;
}
