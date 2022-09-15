import 'package:http/http.dart';

class ClientWrapper {
  ClientWrapper(this.baseClient);

  final Client baseClient;

  Future<StreamedResponse> call(BaseRequest request) =>
      baseClient.send(request);
}