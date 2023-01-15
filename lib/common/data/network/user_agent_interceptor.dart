import 'package:client_info/client_info.dart';
import 'package:http/http.dart';
import 'package:http_client_plus/http_client_plus.dart';

class UserAgentInterceptor implements HttpInterceptor {
  Future<ClientInfo> get _clientInfo => ClientInfoProvider.get();

  @override
  Future<StreamedResponse> intercept(
    BaseRequest request,
    Next next,
  ) async {
    return next(
      request..headers['User-Agent'] = (await _clientInfo).toString(),
    );
  }
}
