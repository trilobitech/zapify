import 'dart:io';

import '../../config_core.dart';

class EnvConfigStorage extends IEnvConfigStorage {
  EnvConfigStorage({Map<String, dynamic> defaults = const {}})
      : _defaults = defaults;

  final Map<String, dynamic> _defaults;

  @override
  T getValue<T extends Object?>(String key) {
    if (!Platform.environment.keys.contains(key)) {
      return _defaults[key];
    }

    final type = T.toString();
    switch (type) {
      case 'bool':
        return bool.fromEnvironment(key) as T;
      case 'String':
        return String.fromEnvironment(key) as T;
      case 'int':
        return int.fromEnvironment(key) as T;
      default:
        throw 'Invalid type: "${T.toString()}"';
    }
  }
}
