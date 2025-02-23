import 'dart:io';

extension DirectoryX on Directory {
  Future<File> createTempFile() async {
    // await (await Directory.systemTemp.createTemp()).createTempFile();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}';
    final file = File('$path/$fileName');
    await file.create();
    return file;
  }
}
