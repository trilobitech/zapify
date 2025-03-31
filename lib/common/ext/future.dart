import 'dart:async';

typedef OnValue<T, R> = FutureOr<R> Function(T value);
typedef OnNullValue<T> = FutureOr<T> Function();

extension FutureExt<T extends Object> on Future<T?> {
  Future<R?> thenIfNotNull<R>(OnValue<T, R> onValue) =>
      then((value) => value != null ? onValue(value) : null);

  Future<T> orDefault(OnNullValue<T> onNullValue) =>
      then<T>((v) => v ?? onNullValue());
}
