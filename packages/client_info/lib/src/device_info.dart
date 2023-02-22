import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:logger_plus/logger_plus.dart';

final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

class DeviceInfo {
  DeviceInfo({
    required this.platform,
    required this.version,
    String? model,
  }) : model = model?.isNotEmpty == true ? model! : 'Unknown';

  factory DeviceInfo.android(AndroidDeviceInfo info) => DeviceInfo(
        platform: 'Android',
        version: info.version.release,
        model: '${info.brand} ${info.model}'.trim(),
      );

  factory DeviceInfo.ios(IosDeviceInfo info) => DeviceInfo(
        platform: 'iOS',
        version: info.systemVersion,
        model: 'Apple ${info.model}'.trim(),
      );

  final String platform;
  final String version;
  final String model;

  static Future<DeviceInfo> fromPlatform() async {
    final plugin = _deviceInfoPlugin;
    try {
      if (Platform.isAndroid) {
        return DeviceInfo.android(await plugin.androidInfo);
      }
      if (Platform.isIOS) {
        return DeviceInfo.ios(await plugin.iosInfo);
      }
    } catch (e, stack) {
      Log.e(e, stack);
    }
    return DeviceInfo(
      platform: Platform.operatingSystem,
      version: Platform.operatingSystemVersion,
    );
  }

  @override
  String toString() => '$platform $version/$model';
}
