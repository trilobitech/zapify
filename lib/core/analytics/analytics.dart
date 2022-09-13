import 'package:amplitude_flutter/amplitude.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:zapify/core/logger.dart';

final Analytics analytics = Analytics();

abstract class AnalyticsWrapper {
  Future<void> init(bool isEnabled);

  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  });

  Future<void> logEvent(name, {Map<String, dynamic> properties = const {}});
}

class Analytics {
  late final wrappers = <AnalyticsWrapper>[
    FirebaseAnalyticsWrapper(),
    AmplitudeAnalyticsWrapper(),
  ];

  Future<void> init(bool isEnabled) async {
    for (final wrapper in wrappers) {
      await wrapper.init(isEnabled);
    }
  }

  screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) {
    _log('screen_viewed', {'screen_name': screenName, ...properties});
    for (final wrapper in wrappers) {
      wrapper
          .screenViewed(screenName, properties: properties)
          .catchError(catchErrorLogger);
    }
  }

  buttonPressed(String name, {Map<String, dynamic> properties = const {}}) =>
      logEvent(
        'button_clicked',
        properties: {'button_name': name, ...properties},
      );

  logEvent(name, {Map<String, dynamic> properties = const {}}) {
    _log(name, properties);
    for (final wrapper in wrappers) {
      wrapper
          .logEvent(name, properties: properties)
          .catchError(catchErrorLogger);
    }
  }

  void _log(String event, Map<String, dynamic> properties) {
    logDebug({'event_name': event, 'properties': properties});
  }
}

class FirebaseAnalyticsWrapper extends AnalyticsWrapper {
  late final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;

  @override
  Future<void> init(bool isEnabled) =>
      _firebase.setAnalyticsCollectionEnabled(isEnabled);

  @override
  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) =>
      _firebase.setCurrentScreen(screenName: screenName);

  @override
  Future<void> logEvent(name, {Map<String, dynamic> properties = const {}}) =>
      _firebase.logEvent(name: name, parameters: properties);
}

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
