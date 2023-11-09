import 'package:amplitude_flutter/amplitude.dart';

import '../wrapper.dart';

class AmplitudeAnalyticsWrapper extends AnalyticsWrapper {
  AmplitudeAnalyticsWrapper({required String apiKey}) : _apiKey = apiKey;

  bool _isEnabled = true;
  final String _apiKey;

  late final Amplitude _instance = Amplitude.getInstance();
  Amplitude? get _amplitude => _isEnabled ? _instance : null;

  @override
  Future<void> init(bool isEnabled) async {
    _isEnabled = isEnabled;
    await _amplitude?.init(_apiKey);
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
    String name, {
    Map<String, dynamic> properties = const {},
  }) async =>
      await _amplitude?.logEvent(name, eventProperties: properties);
}
