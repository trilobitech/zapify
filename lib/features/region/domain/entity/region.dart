import 'package:equatable/equatable.dart';

const _kDefaultRegionCode = 'BR';
const _kDefaultRegionPrefix = 55;

typedef RegionCode = String;
typedef CountryCode = int;

abstract class IRegion extends Equatable implements Comparable<IRegion> {
  RegionCode get code;

  CountryCode get prefix;

  late final String? flag = code.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
      );

  @override
  int compareTo(other) => code.compareTo(other.code);

  @override
  List<Object?> get props => [code];
}

class Region extends IRegion {
  Region({
    required this.code,
    required this.prefix,
  });

  factory Region.defaults() => Region(
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

class Country extends Region {
  Country({
    required super.code,
    required super.prefix,
    required this.name,
  });

  final String name;

  @override
  String toString() => 'Country{name: $name, code: $code, prefix: $prefix}';
}
