import 'package:http/http.dart';

typedef Next = Future<StreamedResponse> Function(BaseRequest request);

abstract class RequestInterceptor {
  Future<StreamedResponse> intercept(BaseRequest request, Next next);
}
