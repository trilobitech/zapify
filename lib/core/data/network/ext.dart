import 'dart:convert';

import 'package:http/http.dart';

extension ResponseExt on Response {
  dynamic get bodyJson => json.decode(body);
}

extension FutureResponseExt on Future<Response> {
  Future<Out> mapJsonWith<In, Out>(Out Function(In) fn) =>
      then((response) => fn(response.bodyJson));
}

extension BaseRequestExt<T extends BaseRequest> on T {
  BaseRequest copyWith({
    String? method,
    Uri? url,
    Map<String, String>? headers,
  }) {
    final other = this;
    late final BaseRequest newRequest;

    if (other is Request) {
      newRequest = Request(method ?? other.method, url ?? other.url)
        ..encoding = other.encoding
        ..bodyBytes = other.bodyBytes;
    } else if (other is MultipartRequest) {
      newRequest = MultipartRequest(method ?? other.method, url ?? other.url)
        ..fields.addAll(other.fields)
        ..files.addAll(other.files);
    } else {
      throw UnsupportedError(
          "Unsupported request type `${runtimeType.toString()}`");
    }

    return newRequest..headers.addAll(headers ?? other.headers);
  }
}
