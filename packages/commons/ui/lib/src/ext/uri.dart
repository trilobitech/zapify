import '../../generated/pubspec_info.dart';

extension UriX on Uri {
  static Uri asset(String path, {String? package = PubspecInfo.name}) =>
      Uri(scheme: 'asset', host: package, path: path);
}
