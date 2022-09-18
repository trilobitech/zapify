import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import 'wrapper.dart';

class Analytics {
  const Analytics(this._wrappers);

  final List<AnalyticsWrapper> _wrappers;

  Future<void> init(bool isEnabled) async {
    for (final wrapper in _wrappers) {
      await wrapper.init(isEnabled);
    }
  }

  void onAppOpened({Map<String, dynamic> properties = const {}}) =>
      logEvent('app_opened', properties: properties);

  void onAppLifecycleChanged(AppLifecycleState state) =>
      logEvent('app_${state.name}');

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

  void itemSelected(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_selected',
        properties: {'item_name': name, ...properties},
      );

  void itemLongPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_long_pressed',
        properties: {'item_name': name, ...properties},
      );

  void itemRemoved(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_removed',
        properties: {'item_name': name, ...properties},
      );

  void intentHandled(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'intent_handled',
        properties: {'intent_name': name, ...properties},
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
