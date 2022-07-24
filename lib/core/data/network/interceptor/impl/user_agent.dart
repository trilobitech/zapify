import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:zapify/core/data/network/interceptor/interceptor.dart';

class UserAgentInterceptor implements RequestInterceptor {
  @override
  Future<StreamedResponse> intercept(
    BaseRequest request,
    Next next,
  ) async {
    final clientInfo = await _clientInfo;

    request.headers['User-Agent'] = clientInfo.userAgent;
    request.headers['X-Build-Version'] = clientInfo.buildNumber;

    return next(request);
  }

  Future<_ClientInfo> get _clientInfo async {
    final deviceInfo = await _deviceInfo();
    final appInfo = await _appInfo();

    return _ClientInfo(
      userAgent: '$deviceInfo/${appInfo.version}',
      buildNumber: appInfo.buildNumber,
    );
  }

  Future<_AppInfo> _appInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return _AppInfo(
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    );
  }

  Future<String> _deviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    late _DeviceInfo deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = _DeviceInfo(
        platform: 'Unknown',
        version: '0.0.0',
        model: 'Unknown',
      );
    }

    return '${deviceData.platform} ${deviceData.version}/${deviceData.model}';
  }

  _DeviceInfo _readAndroidBuildData(AndroidDeviceInfo build) {
    return _DeviceInfo(
      platform: 'Android',
      version: build.version.release,
      model: '${build.brand} ${build.model}',
    );
  }

  _DeviceInfo _readIosDeviceInfo(IosDeviceInfo data) {
    return _DeviceInfo(
      platform: 'iOS',
      version: data.systemVersion,
      model: data.model,
    );
  }
}

class _DeviceInfo {
  final String platform;
  final String version;
  final String model;

  _DeviceInfo({
    required this.platform,
    required this.model,
    required this.version,
  });
}

class _AppInfo {
  _AppInfo({
    required this.version,
    required this.buildNumber,
  });

  final String version;
  final String buildNumber;
}

class _ClientInfo {
  _ClientInfo({
    required this.userAgent,
    required this.buildNumber,
  });

  final String userAgent;
  final String buildNumber;
}
