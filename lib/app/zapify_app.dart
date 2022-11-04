import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zapify/app/styles/theme.dart';
import 'package:zapify/core/analytics/analytics.dart';
import 'package:zapify/core/analytics/route_observer.dart';
import 'package:zapify/features/home/presentation/home_page.dart';

class ZapifyApp extends StatefulWidget {
  const ZapifyApp({super.key});

  @override
  State<ZapifyApp> createState() => _ZapifyAppState();
}

class _ZapifyAppState extends State<ZapifyApp> with WidgetsBindingObserver {
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
