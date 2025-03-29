import 'package:equatable/equatable.dart';

class Color extends Equatable {
  const Color._(this.value);

  factory Color(dynamic value) {
    if (value is int) {
      return Color._(value);
    }
    if (value is String) {
      return Color.fromString(value);
    }
    throw ArgumentError('Unsupported color value: "$value"');
  }

  factory Color.fromString(String hexColor) {
    final value = hexColor.replaceFirst('#', '');
    assert(value.length >= 6 && value.length <= 8, 'Invalid value for color: "$hexColor"');
    return Color._(int.parse(value, radix: 16));
  }

  final int value;

  @override
  String toString() => '#${value.toRadixString(16).padLeft(8, '0')}';

  @override
  List get props => [value];
}
