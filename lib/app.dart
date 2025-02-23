import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_nav/simple_nav.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'common/di/inject.dart';
import 'common/resources/l10n/generated/app_localizations.dart';
import 'common/resources/theme.dart';
import 'routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();
  static Locale get currentLocale =>
      Localizations.localeOf(navigatorKey.currentContext!);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late final IAnalytics analytics = get();
  late final AnalyticsRouteObserver observer = AnalyticsRouteObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt', timeago.PtBrMessages());

    return MaterialApp(
      title: 'Zapify',
      navigatorKey: App.navigatorKey,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      //locale: const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: '/',
      onGenerateRoute: RouteResolver(routes),
      debugShowCheckedModeBanner: kDebugMode && !Platform.isIOS,
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
