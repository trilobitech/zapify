import 'dart:io';

import 'package:http/http.dart';
import 'package:zapify/core/data/network/interceptor/interceptor.dart';
import 'package:zapify/core/data/network/network_info.dart';

class ConnectionInterceptor implements RequestInterceptor {
  ConnectionInterceptor(this.networkInfo);

  final INetworkInfo networkInfo;

  @override
  Future<StreamedResponse> intercept(
    BaseRequest request,
    Next next,
  ) async {
    if (!await networkInfo.isConnected) {
      throw InternetConnectionException();
    }
    try {
      return next(request);
    } catch (e) {
      if (e is IOException && !await networkInfo.isConnected) {
        throw InternetConnectionException();
      }
      rethrow;
    }
  }
}

class InternetConnectionException implements Exception {}
