import 'dart:math' as math;

class PhoneNumberValue {
  const PhoneNumberValue({
    required this.national,
    required this.raw,
    required this.formatted,
  });

  final String national;
  final String raw;
  final String formatted;

  String get obfuscated {
    final withoutFormat = raw.replaceAll(RegExp(r'[^+0-9]'), '');
    final size = withoutFormat.length;
    final partial = withoutFormat.substring(0, math.min(4, size));
    return partial.padRight(size, '*');
  }

  @override
  String toString() => 'PhoneNumberValue{$obfuscated}';
}
