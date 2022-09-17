import 'package:http/http.dart';

import '../ext/request.dart';
import '../interceptor.dart';

class ResolveBaseUrlInterceptor extends HttpInterceptor {
  ResolveBaseUrlInterceptor(this.baseUrl);

  final Uri baseUrl;

  @override
  Future<StreamedResponse> intercept(BaseRequest request, Next next) {
    if (request.url.hasScheme) {
      return next(request);
    }

    BaseRequest newRequest = request.copyWith(
      url: baseUrl.resolveUri(request.url),
    );

    return next(newRequest);
  }
}
