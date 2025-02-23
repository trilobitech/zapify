import 'dart:collection';

import 'package:dotenv/dotenv.dart';

class EnvMap extends MapBase<String, String> implements Map<String, String> {
  late final DotEnv _env = DotEnv()..load();

  @override
  // ignore: invalid_use_of_visible_for_testing_member
  Iterable<String> get keys => _env.map.keys;

  @override
  // ignore: invalid_use_of_visible_for_testing_member
  int get length => _env.map.length;

  @override
  String? operator [](Object? key) {
    if (key is String) {
      return _env[key];
    }
    return null;
  }

  @override
  void operator []=(String key, String value) {
    throw UnsupportedError('Cannot modify environment variables');
  }

  @override
  String remove(Object? key) {
    throw UnsupportedError('Cannot modify environment variables');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot modify environment variables');
  }
}
