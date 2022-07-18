class Color {
  Color._(this.value);

  int value;

  factory Color(dynamic value) {
    if (value is int) {
      return Color._(value);
    }
    if (value is String) {
      return Color.fromString(value);
    }
    throw 'Unsupported value: "$value"';
  }

  factory Color.fromString(String hexColor) {
    final value = hexColor.replaceFirst('#', '');
    assert(
      value.length >= 6 && value.length <= 8,
      'Invalid value for color: "$hexColor"',
    );
    return Color._(int.parse(value, radix: 16));
  }

  @override
  String toString() => '#${value.toRadixString(16).padLeft(8, '0')}';
}
