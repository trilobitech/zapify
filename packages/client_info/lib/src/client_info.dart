import 'device_info.dart';

class ClientInfo {
  ClientInfo({
    required this.appName,
    required this.appVersion,
    required this.device,
  });

  final String appName;
  final String appVersion;
  final DeviceInfo device;

  @override
  String toString() => '$appName $appVersion/$device';
}
