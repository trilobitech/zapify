import 'package:amplitude_flutter/amplitude.dart';
import 'package:zapify/config/env_config.dart';
import 'package:zapify/core/analytics/wrapper.dart';

class AmplitudeAnalyticsWrapper extends AnalyticsWrapper {
  bool _isEnabled = true;
  late final Amplitude _instance = Amplitude.getInstance();
  Amplitude? get _amplitude => _isEnabled ? _instance : null;

  @override
  Future<void> init(bool isEnabled) async {
    _isEnabled = isEnabled;
    // TODO: retrieve key from constructor
    await _amplitude?.init(await EnvConfig.amplitudeKey.get());
  }

  @override
  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'screen_viewed',
        properties: {'screen_name': screenName, ...properties},
      );

  @override
  Future<void> logEvent(
    name, {
    Map<String, dynamic> properties = const {},
  }) async =>
      await _amplitude?.logEvent(name, eventProperties: properties);
}
