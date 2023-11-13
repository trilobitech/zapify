import 'package:flutter/widgets.dart';

import 'analytics.dart';

mixin AnalyticsMixin implements IAnalytics {
  @override
  void onAppOpened({Map<String, Object> properties = const {}}) =>
      logEvent('app_opened', properties: properties);

  @override
  void onAppLifecycleChanged(AppLifecycleState state) =>
      logEvent('app_${state.name}');

  @override
  void screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'screen_viewed',
        properties: {'screen_name': screenName, ...properties},
      );

  @override
  void buttonPressed(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'button_clicked',
        properties: {'button_name': name, ...properties},
      );

  @override
  void itemSelected(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'item_selected',
        properties: {'item_name': name, ...properties},
      );

  @override
  void itemLongPressed(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'item_long_pressed',
        properties: {'item_name': name, ...properties},
      );

  @override
  void itemRemoved(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'item_removed',
        properties: {'item_name': name, ...properties},
      );

  @override
  void intentHandled(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      logEvent(
        'intent_handled',
        properties: {'intent_name': name, ...properties},
      );
}
