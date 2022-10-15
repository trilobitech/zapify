import 'dart:io';

import 'package:http/http.dart';

import '../interceptor.dart';
import '../network_info.dart';

typedef IsConnectivityError = Future<bool> Function(
  dynamic exception,
  INetworkInfo networkInfo,
);

class InternetConnectionException implements Exception {}

class ConnectionInterceptor implements HttpInterceptor {
  ConnectionInterceptor({
    INetworkInfo? networkInfo,
    IsConnectivityError? isConnectivityError,
  })  : _networkInfo = networkInfo ?? NetworkInfo(),
        _isConnectivityError =
            isConnectivityError ?? defaultIsConnectivityErrorChecker;

  final INetworkInfo _networkInfo;
  final IsConnectivityError _isConnectivityError;

  @override
  Future<StreamedResponse> intercept(BaseRequest request, Next next) async {
    if (!await _networkInfo.isConnected) {
      throw InternetConnectionException();
    }
    try {
      return next(request);
    } catch (e) {
      if (await _isConnectivityError(e, _networkInfo)) {
        throw InternetConnectionException();
      }
      rethrow;
    }
  }
}

Future<bool> defaultIsConnectivityErrorChecker(
  dynamic exception,
  INetworkInfo networkInfo,
) async {
  return exception is IOException && !await networkInfo.isConnected;
}
