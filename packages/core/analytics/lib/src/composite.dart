import 'dart:async';

import 'package:flutter/widgets.dart';

import 'analytics.dart';

class CompositeAnalytics extends IAnalytics {
  CompositeAnalytics(this._wrappers);

  final List<IAnalytics> _wrappers;

  @override
  Future<void> init() => Future.wait(
        _wrappers.map((wrapper) => wrapper.init()),
      );

  @override
  void onAppOpened({
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.onAppOpened(properties: properties),
      );

  @override
  void onAppLifecycleChanged(
    AppLifecycleState state,
  ) =>
      _wrappers.map(
        (wrapper) => wrapper.onAppLifecycleChanged(state),
      );

  @override
  void screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.screenViewed(screenName, properties: properties),
      );

  @override
  void buttonPressed(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.buttonPressed(name, properties: properties),
      );

  @override
  void itemSelected(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.itemSelected(name, properties: properties),
      );

  @override
  void itemLongPressed(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.itemLongPressed(name, properties: properties),
      );

  @override
  void itemRemoved(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.itemRemoved(name, properties: properties),
      );

  @override
  void intentHandled(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _wrappers.map(
        (wrapper) => wrapper.intentHandled(name, properties: properties),
      );

  @override
  void logEvent(name, {Map<String, Object> properties = const {}}) =>
      _wrappers.map(
        (wrapper) => wrapper.logEvent(name, properties: properties),
      );
}
