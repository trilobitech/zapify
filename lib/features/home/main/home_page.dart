import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart' hide Intent;
import 'package:receive_intent/receive_intent.dart';
import 'package:rxdart/utils.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../common/di/provider.dart';
import '../../../common/ext/context.dart';
import '../../../common/services/share_service.dart';
import '../../../common/widgets/tab_page.dart';
import '../../call_log/call_log_mediator.dart';
import '../../call_log/presentation/call_log_bloc.dart';
import '../../call_log/presentation/call_log_page.dart';
import '../../history/history_mediator.dart';
import '../../history/presentation/history_bloc.dart';
import '../../history/presentation/history_page.dart';
import '../../region/domain/entity/region.dart';
import '../../region/region_mediator.dart';
import '../ad_banner/presentation/ad_banner_widget.dart';
import '../chat_apps/chat_apps_mediator.dart';
import '../chat_apps/presentation/chat_apps_bloc.dart';
import '../chat_apps/presentation/chat_apps_widget.dart';
import '../phone/phone_field_component.dart';
import '../phone/presentation/phone_field_bloc.dart';
import '../phone/presentation/phone_field_widget.dart';
import '../top_banner/presentation/top_banner_widget.dart';
import 'home_bloc.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
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
    child: const _HomePage(),
  );
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  final String title = 'Zapify';

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage>
    with ActionMixin<HomeBloc, HomeAction> {
  late final _shareService = ShareService();
  final _sub = CompositeSubscription();

  void _init() {
    if (Platform.isAndroid) {
      _sub.add(_shareService.stream().listen(_handleIntent));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  @override
  void dispose() async {
    super.dispose();
    await _sub.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            itemBuilder:
                (context) => [
                  PopupMenuItem<String>(
                    value: '/settings',
                    child: Text(context.strings.actionSettings),
                  ),
                ],
            onSelected: (destination) async {
              await Navigator.pushNamed(context, destination);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBannerWidget(),
          PhoneFieldWidget(),
          ChatAppsWidget(),
          Expanded(child: TabListView(tabs: [HistoryPage(), CallLogTabPage()])),
        ],
      ),
      bottomNavigationBar: AdBannerWidget(),
    );
  }

  @override
  FutureOr<void> handleAction(BuildContext context, HomeAction action) =>
      switch (action) {
        NavigateToRegionPickerHomeAction(:final current) =>
          _navigateToRegionPicker(context, current),
      };

  Future<void> _navigateToRegionPicker(
    BuildContext context,
    String? regionCode,
  ) async {
    final bloc = context.read<RegionMediator>();

    final selectedRegion = await Navigator.pushNamed(
      context,
      '/regions',
      arguments: {'selected_code': regionCode},
    );

    if (selectedRegion is IRegion) {
      await bloc.onRegionSelected(selectedRegion);
    }
  }

  void _handleIntent(Intent intent) =>
      context.read<HomeBloc>().onIntentReceived(intent);
}
