import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'common/resources/theme.dart';
import 'features/home/main/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  static AnalyticsRouteObserver observer = AnalyticsRouteObserver(
    analytics: analytics,
    nameExtractor: _routeNameExtractor,
  );

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt', timeago.PtBrMessages());

    return MaterialApp(
      title: 'Zapify',
      home: const HomePage(),
      theme: AppTheme.of(context),
      // locale: const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: <NavigatorObserver>[observer],
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

  static String? _routeNameExtractor(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return 'HomePage';
      default:
        return settings.name;
    }
  }
}
