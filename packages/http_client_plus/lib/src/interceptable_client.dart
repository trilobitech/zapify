import 'package:http/http.dart';

import 'client_wrapper.dart';
import 'interceptor.dart';
import 'interceptors/assets.dart';
import 'interceptors/base_url_resolver.dart';
import 'interceptors/connection.dart';

class InterceptableClient extends BaseClient {
  InterceptableClient({
    List<HttpInterceptor> interceptors = const [],
    Client? baseClient,
  })  : client = ClientWrapper(baseClient ?? Client()),
        interceptors = interceptors.reversed;

  final ClientWrapper client;
  final Iterable<HttpInterceptor> interceptors;

  factory InterceptableClient.withDefaultInterceptors({
    Uri? baseUrl,
    Client? baseClient,
    Iterable<HttpInterceptor> interceptors = const [],
  }) =>
      InterceptableClient(
        baseClient: baseClient,
        interceptors: [
          AssetsInterceptor(),
          ConnectionInterceptor(),
          if (baseUrl != null) ResolveBaseUrlInterceptor(baseUrl),
          ...interceptors,
        ],
      );

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return interceptors.fold<Next>(
      client,
      (chain, interceptor) {
        return (BaseRequest request) => interceptor.intercept(request, chain);
      },
    ).call(request);
  }
}
