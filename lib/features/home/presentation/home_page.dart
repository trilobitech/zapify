import 'dart:async';

import 'package:bloc_plus/bloc_plus.dart';
import 'package:flutter/material.dart' hide Intent;
import 'package:receive_intent/receive_intent.dart';
import 'package:rxdart/utils.dart';

import '../../../common/arch/provider.dart';
import '../../../common/services/share_service.dart';
import '../../../common/widgets/tab_list_view.dart';
import '../../call_log/call_log_mediator.dart';
import '../../call_log/presentation/call_log_bloc.dart';
import '../../call_log/presentation/call_log_page.dart';
import '../../history/history_mediator.dart';
import '../../history/presentation/history_bloc.dart';
import '../../history/presentation/history_page.dart';
import '../../region/domain/entity/region.dart';
import '../../region/presentation/region_picker_page.dart';
import '../../region/region_mediator.dart';
import '../components/ad_banner/presentation/ad_banner_widget.dart';
import '../components/chat_apps/chat_apps_mediator.dart';
import '../components/chat_apps/presentation/chat_apps_bloc.dart';
import '../components/chat_apps/presentation/chat_apps_widget.dart';
import '../components/phone/phone_field_component.dart';
import '../components/phone/presentation/phone_field_bloc.dart';
import '../components/phone/presentation/phone_field_widget.dart';
import '../components/top_banner/presentation/top_banner_widget.dart';
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

  Future<void> _init() async {
    _sub.add(
      _shareService.stream().listen(_handleIntent),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  @override
  void dispose() {
    _sub.dispose();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBannerWidget(),
          PhoneFieldWidget(),
          ChatAppsWidget(),
          Expanded(
            child: TabListView(tabs: [
              HistoryPage(),
              CallLogTabPage(),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: AdBannerWidget(),
    );
  }

  @override
  FutureOr<void> handleAction(BuildContext context, HomeAction action) =>
      action.when(
        navigateToRegionPicker: (current) =>
            _navigateToRegionPicker(context, current),
      );

  Future<void> _navigateToRegionPicker(
    BuildContext context,
    String? regionCode,
  ) async {
    final bloc = context.read<RegionMediator>();

    final route = MaterialPageRoute(
      fullscreenDialog: true,
      settings: const RouteSettings(name: 'RegionPicker'),
      builder: (_) => RegionPicker(selected: regionCode),
    );

    final selectedRegion = await Navigator.of(context).push(route);

    if (selectedRegion is IRegion) {
      await bloc.onRegionSelected(selectedRegion);
    }
  }

  Future _handleIntent(Intent intent) =>
      context.read<HomeBloc>().onIntentReceived(intent);
}
