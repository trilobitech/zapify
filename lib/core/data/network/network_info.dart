import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> get isConnected => _connectivity
      .checkConnectivity()
      .then((result) => result != ConnectivityResult.none);
}
