import 'package:zapify/core/analytics/impl/amplitude.dart';
import 'package:zapify/core/analytics/impl/firebase.dart';
import 'package:zapify/core/analytics/wrapper.dart';
import 'package:zapify/core/logger.dart';

final Analytics analytics = Analytics([
  FirebaseAnalyticsWrapper(),
  AmplitudeAnalyticsWrapper(),
]);

class Analytics {
  const Analytics(this._wrappers);

  final List<AnalyticsWrapper> _wrappers;

  Future<void> init(bool isEnabled) async {
    for (final wrapper in _wrappers) {
      await wrapper.init(isEnabled);
    }
  }

  void screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) {
    _log('screen_viewed', {'screen_name': screenName, ...properties});
    for (final wrapper in _wrappers) {
      wrapper
          .screenViewed(screenName, properties: properties)
          .catchError(catchErrorLogger);
    }
  }

  void buttonPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'button_clicked',
        properties: {'button_name': name, ...properties},
      );

  void logEvent(name, {Map<String, dynamic> properties = const {}}) {
    _log(name, properties);
    for (final wrapper in _wrappers) {
      wrapper
          .logEvent(name, properties: properties)
          .catchError(catchErrorLogger);
    }
  }

  void _log(String event, Map<String, dynamic> properties) {
    logDebug(
      {'event_name': event, 'properties': properties},
      skipCallerFile: true,
    );
  }
}