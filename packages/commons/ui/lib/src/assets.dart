import 'ext/uri.dart';

class Assets {
  const Assets._();

  factory Assets() => _instance ??= const Assets._();

  static Assets? _instance;

  final $Illustrations$ illustrations = const $Illustrations$('assets');

  final $Icons$ icons = const $Icons$('assets');
}

class Asset {
  const Asset(String directory) : _directory = directory;

  final String _directory;

  Uri byName(String name) => UriX.asset('$_directory/$name.svg');
}

class $Illustrations$ extends Asset {
  const $Illustrations$(String directory) : super('$directory/illustrations');
}

class $Icons$ extends Asset {
  const $Icons$(String directory) : super('$directory/icons');
}
