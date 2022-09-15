import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo extends INetworkInfo {
  NetworkInfo([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected => _connectivity
      .checkConnectivity()
      .then((result) => result != ConnectivityResult.none);
}
