import 'package:analytics_core/analytics_core.dart';
import 'package:di_core/di_core.dart';
import 'package:flutter/material.dart';
import 'package:resources/localizations.dart';
import 'package:resources/theme.dart';
import 'package:simple_nav/simple_nav.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late final IAnalytics analytics = get();
  late final AnalyticsRouteObserver observer =
      AnalyticsRouteObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt', timeago.PtBrMessages());

    return MaterialApp(
      title: 'Zapify',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      // locale: const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      navigatorKey: navigatorKey,
      navigatorObservers: <NavigatorObserver>[observer],
      onGenerateRoute: RouteResolver(routes),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    analytics.onAppLifecycleChanged(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
