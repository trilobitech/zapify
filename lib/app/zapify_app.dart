import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../common/arch/provider.dart';
import '../features/call_log/call_log_mediator.dart';
import '../features/call_log/presentation/call_log_bloc.dart';
import '../features/history/history_mediator.dart';
import '../features/history/presentation/history_bloc.dart';
import '../features/home/components/chat_apps/chat_apps_mediator.dart';
import '../features/home/components/chat_apps/presentation/chat_apps_bloc.dart';
import '../features/home/components/phone/phone_field_component.dart';
import '../features/home/components/phone/presentation/phone_field_bloc.dart';
import '../features/home/presentation/home_bloc.dart';
import '../features/home/presentation/home_page.dart';
import '../features/region/region_mediator.dart';
import 'theme.dart';

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
      home: MultiProvider(
        providers: [
          DiProvider<HomeBloc>(),
          DiProvider<PhoneFieldBloc>(),
          DiProvider<ChatAppsBloc>(),
          DiProvider<HistoryBloc>(),
          DiProvider<CallLogBloc>(),
          ProxyProvider<RegionMediator, HomeBloc>(),
          ProxyProvider<HistoryMediator, HomeBloc>(),
          ProxyProvider<ChatAppsMediator, HomeBloc>(),
          ProxyProvider<CallLogMediator, HomeBloc>(),
          ProxyProvider<PhoneFieldComponent, PhoneFieldBloc>(),
        ],
        child: const HomePage(),
      ),
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
