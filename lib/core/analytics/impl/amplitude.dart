import 'package:amplitude_flutter/amplitude.dart';
import 'package:zapify/core/analytics/wrapper.dart';

class AmplitudeAnalyticsWrapper extends AnalyticsWrapper {
  bool _isEnabled = true;
  late final Amplitude _instance = Amplitude.getInstance();
  Amplitude? get _amplitude => _isEnabled ? _instance : null;

  @override
  Future<void> init(bool isEnabled) async {
    _isEnabled = isEnabled;
    // TODO: retrieve key from env var
    await _amplitude?.init('secret');
  }

  @override
  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'screen_viewd',
        properties: {'screen_name': screenName, ...properties},
      );

  @override
  Future<void> logEvent(
    name, {
    Map<String, dynamic> properties = const {},
  }) async =>
      await _amplitude?.logEvent(name, eventProperties: properties);
}
