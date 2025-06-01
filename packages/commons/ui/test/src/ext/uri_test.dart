import 'package:flutter_test/flutter_test.dart';
import 'package:ui/generated/pubspec_info.dart';
import 'package:ui/src/ext/uri.dart';

void main() {
  group('UriX', () {
    group('asset', () {
      test('should parse asset correctly', () {
        expect(
          UriX.asset('illustration/image.svg'),
          Uri.parse('asset://${PubspecInfo.name}/illustration/image.svg'),
        );
      });
    });
  });
}
