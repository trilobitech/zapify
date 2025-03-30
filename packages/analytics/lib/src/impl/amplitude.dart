import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:flutter/foundation.dart';

import '../wrapper.dart';

class AmplitudeAnalyticsWrapper extends AnalyticsWrapper {
  AmplitudeAnalyticsWrapper({required String apiKey}) : _apiKey = apiKey;

  bool _isEnabled = kReleaseMode;
  final String _apiKey;

  late final Amplitude _instance = Amplitude(Configuration(apiKey: _apiKey));

  Amplitude? get _amplitude => _isEnabled ? _instance : null;

  @override
  Future<void> init(bool isEnabled) async {
    _isEnabled = isEnabled;
  }

  @override
  Future<void> screenViewed(String screenName, {Map<String, Object> properties = const {}}) =>
      logEvent('screen_viewed', properties: {'screen_name': screenName, ...properties});

  @override
  Future<void> logEvent(String name, {Map<String, Object> properties = const {}}) async =>
      await _amplitude?.track(BaseEvent(name, eventProperties: properties));
}
