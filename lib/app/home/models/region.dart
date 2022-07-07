class Region extends Comparable<Region> {
  Region(this.code, this.prefix, this.name);

  final String code;
  final int prefix;
  final String name;
  late String? flag = code.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
      );

  @override
  int compareTo(other) => code.compareTo(other.code);

  @override
  String toString() => 'Region{name: $name, code: $code, prefix: $prefix}';
}
