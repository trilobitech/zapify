import 'package:flutter/widgets.dart';
import 'package:zapify/core/analytics/analytics.dart';

typedef ScreenNameExtractor = String? Function(RouteSettings settings);

String? defaultNameExtractor(RouteSettings settings) {
  if (settings.name == '/') {
    return 'HomePage';
  }
  return settings.name;
}

typedef RouteFilter = bool Function(Route<dynamic>? route);

bool defaultRouteFilter(Route<dynamic>? route) => route is PageRoute;

/// Based on `FirebaseAnalyticsObserver`
class AnalyticsRouteObserver extends RouteObserver<ModalRoute<dynamic>> {
  AnalyticsRouteObserver({
    required this.analytics,
    this.nameExtractor = defaultNameExtractor,
    this.routeFilter = defaultRouteFilter,
  });

  final Analytics analytics;
  final ScreenNameExtractor nameExtractor;
  final RouteFilter routeFilter;

  void _sendScreenView(Route<dynamic> route) {
    final String? screenName = nameExtractor(route.settings);
    if (screenName != null) {
      analytics.screenViewed(screenName);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (routeFilter(route)) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && routeFilter(newRoute)) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null &&
        routeFilter(previousRoute) &&
        routeFilter(route)) {
      _sendScreenView(previousRoute);
    }
  }
}
