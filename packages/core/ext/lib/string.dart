extension StringExt on String {
  // https://stackoverflow.com/a/66554024
  String format(List<dynamic> params) {
    var index = 0;
    return replaceAllMapped(
      RegExp(r'{.*?}'),
      (_) => params[index++],
    );
  }

  // https://stackoverflow.com/a/66554024
  String formatWithMap(Map<String, dynamic> params) {
    return replaceAllMapped(RegExp(r'{(.*?)}'), (match) {
      final mapped = params[match[1]];
      if (mapped == null) {
        throw ArgumentError('$params does not contain the key "${match[1]}"');
      }
      return mapped;
    });
  }
}
