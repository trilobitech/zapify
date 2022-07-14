import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zapfy/core/firebase.dart';
import 'package:zapfy/features/home/presentation/home_page.dart';

class ZapfyApp extends StatelessWidget {
  const ZapfyApp({Key? key}) : super(key: key);

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      title: 'Appfy',
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}
