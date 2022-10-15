import 'dart:convert';

import 'package:http/http.dart';

extension ResponseExt on Response {
  dynamic get bodyJson => json.decode(body);
}

extension FutureResponseExt on Future<Response> {
  Future<Out> mapJsonWith<In, Out>(Out Function(In) fn) =>
      then((response) => fn(response.bodyJson));
}
