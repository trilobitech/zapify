import 'inject.dart';

Lazy<T> lazy<T extends Object>() => Lazy();

class Lazy<T extends Object> {
  T? _instance;

  Future<T> get() async => _instance ??= await lazyGet();
}
