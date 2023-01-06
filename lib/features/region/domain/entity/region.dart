const _kDefaultRegionCode = 'BR';
const _kDefaultRegionPrefix = 55;

typedef RegionCode = String;
typedef CountryCode = int;

abstract class IRegion implements Comparable<IRegion> {
  RegionCode get code;

  CountryCode get prefix;

  late String? flag = code.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
      );

  @override
  int compareTo(other) => code.compareTo(other.code);
}

class RegionInfo extends IRegion {
  RegionInfo({
    required this.code,
    required this.prefix,
  });

  factory RegionInfo.defaults() => RegionInfo(
        code: _kDefaultRegionCode,
        prefix: _kDefaultRegionPrefix,
      );

  @override
  final RegionCode code;

  @override
  final CountryCode prefix;

  @override
  String toString() => 'RegionInfo{code: $code, prefix: $prefix}';
}

class Country extends RegionInfo {
  Country({
    required super.code,
    required super.prefix,
    required this.name,
  });

  final String name;

  @override
  String toString() => 'Region{name: $name, code: $code, prefix: $prefix}';
}
