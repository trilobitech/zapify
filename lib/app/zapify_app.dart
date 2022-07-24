import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zapify/core/firebase.dart';
import 'package:zapify/core/logger.dart';
import 'package:zapify/features/home/presentation/home_page.dart';

class ZapifyApp extends StatelessWidget {
  const ZapifyApp({Key? key}) : super(key: key);

  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
    nameExtractor: nameExtractor,
    onError: logError,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    timeago.setLocaleMessages('pt', timeago.PtBrMessages());

    return MaterialApp(
      title: 'Zapify',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: theme.appBarTheme.copyWith(
          foregroundColor: Colors.teal,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      // locale: const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }

  static String? nameExtractor(RouteSettings settings) {
    if (settings.name == '/') {
      return 'HomePage';
    }
    return settings.name;
  }
}
