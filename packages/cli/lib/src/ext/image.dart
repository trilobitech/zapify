import 'dart:io';

import 'package:image/image.dart';

extension FileX on File {
  Future<Image> readAsImage() async {
    final bytes = await readAsBytes();
    final image = decodeImage(bytes);
    if (image == null) {
      throw Exception('Failed to decode image');
    }
    return image;
  }
}
