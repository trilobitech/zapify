import 'package:http/http.dart';

typedef Next = Future<StreamedResponse> Function(BaseRequest request);

abstract class HttpInterceptor {
  Future<StreamedResponse> intercept(BaseRequest request, Next next);
}
