import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart';

import '../interceptor.dart';

class AssetsInterceptor extends HttpInterceptor {
  AssetsInterceptor({this.assetsRootPath = 'assets'});

  String assetsRootPath;

  @override
  Future<StreamedResponse> intercept(BaseRequest request, Next next) async {
    final url = request.url;
    if (!url.isScheme('assets')) {
      return next(request);
    }

    final path = url.toString().replaceFirst('assets:/', assetsRootPath);
    final data = await rootBundle.load(path);
    final intData =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    return StreamedResponse(
      Stream.value(intData),
      200,
      request: request,
      persistentConnection: false,
    );
  }
}
