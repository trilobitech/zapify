import 'package:http/http.dart';
import 'package:zapify/core/data/network/ext.dart';
import 'package:zapify/core/data/network/interceptor/impl/assets.dart';
import 'package:zapify/core/data/network/interceptor/impl/connection.dart';
import 'package:zapify/core/data/network/interceptor/impl/user_agent.dart';
import 'package:zapify/core/data/network/interceptor/interceptor.dart';
import 'package:zapify/core/data/network/network_info.dart';

class ApiClient extends BaseClient {
  ApiClient(
    this.baseUrl, [
    this.interceptors = const [],
  ]);

  factory ApiClient.withDefaultInterceptors({
    Uri? baseUrl,
    List<RequestInterceptor> interceptors = const [],
  }) =>
      ApiClient(baseUrl ?? Uri(), [
        AssetsInterceptor(),
        ConnectionInterceptor(NetworkInfo()),
        UserAgentInterceptor(),
        ...interceptors,
      ]);

  final Uri baseUrl;
  final List<RequestInterceptor> interceptors;

  Next get _sendRequest => _proceed();

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    BaseRequest newRequest = request.copyWith(
      url: baseUrl.resolveUri(request.url),
    );
    return _sendRequest(newRequest);
  }

  Next _proceed([int index = 0]) {
    return (BaseRequest request) {
      if (index < interceptors.length) {
        final RequestInterceptor next = interceptors[index];
        return next.intercept(request, _proceed(index + 1));
      }
      if (request is MultipartRequest) return request.send();
      return Client().send(request);
    };
  }
}
