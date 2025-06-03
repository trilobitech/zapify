import 'package:simple_nav/simple_nav.dart';

extension RouteExtrasX on RouteExtras {
  T? getFromData<T extends Object>(String key) {
    final data = this.data;
    return data is Map<String, dynamic> ? data[key] as T? : null;
  }
}
