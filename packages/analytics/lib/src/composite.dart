import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import 'wrapper.dart';

class Analytics implements IAnalytics {
  Analytics(this._wrappers);

  final List<AnalyticsWrapper> _wrappers;
  final Logger _logger = Logger('analytics');

  Future<void> init(bool isEnabled) async {
    await Future.wait(
      _wrappers.map(
        (wrapper) => wrapper.init(isEnabled),
      ),
    );
  }

  @override
  void onAppOpened({Map<String, dynamic> properties = const {}}) =>
      logEvent('app_opened', properties: properties);

  @override
  void onAppLifecycleChanged(AppLifecycleState state) =>
      logEvent('app_${state.name}');

  @override
  void screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) async {
    _log('screen_viewed', {'screen_name': screenName, ...properties});
    for (final wrapper in _wrappers) {
      await wrapper
          .screenViewed(screenName, properties: properties)
          .catchError(_catchErrorLogger('screen_viewed'));
    }
  }

  @override
  void buttonPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'button_clicked',
        properties: {'button_name': name, ...properties},
      );

  @override
  void itemSelected(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_selected',
        properties: {'item_name': name, ...properties},
      );

  @override
  void itemLongPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_long_pressed',
        properties: {'item_name': name, ...properties},
      );

  @override
  void itemRemoved(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'item_removed',
        properties: {'item_name': name, ...properties},
      );

  @override
  void intentHandled(
    String name, {
    Map<String, dynamic> properties = const {},
  }) =>
      logEvent(
        'intent_handled',
        properties: {'intent_name': name, ...properties},
      );

  @override
  void logEvent(
    String name, {
    Map<String, dynamic> properties = const {},
  }) async {
    _log(name, properties);
    for (final wrapper in _wrappers) {
      await wrapper
          .logEvent(name, properties: properties)
          .catchError(_catchErrorLogger(name));
    }
  }

  void _log(String event, Map<String, dynamic> properties) {
    _logger.info(
      {
        'event_name': event,
        'properties': properties,
      },
      null,
      Trace.current(3),
    );
  }

  dynamic _catchErrorLogger(event) {
    final callerTrace = Trace.current(1);
    return (Object error, [StackTrace? trace]) {
      _logger.warning(
        'Error while logging event: $event',
        error,
        trace ?? callerTrace,
      );
    };
  }
}
