import 'package:package_info/package_info.dart';

import 'client_info.dart';
import 'device_info.dart';

abstract class ClientInfoProvider {
  static ClientInfo? _cached;

  static Future<ClientInfo> get() async => _cached ??= await _create();

  static Future<ClientInfo> _create() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final deviceInfo = await DeviceInfo.fromPlatform();

    return ClientInfo(
      appName: packageInfo.appName,
      appVersion: packageInfo.version,
      device: deviceInfo,
    );
  }
}
