import 'package:http/http.dart';

extension ClientExt on Client {
  Future<StreamedResponse> upload(
    Uri url,
    Iterable<MultipartFile> files, {
    String method = 'POST',
    Map<String, String> fields = const <String, String>{},
  }) {
    final request = MultipartRequest(method, url)
      ..files.addAll(files)
      ..fields.addAll(fields);

    return send(request);
  }
}
