import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart' hide Intent;
import 'package:logger_plus/logger_plus.dart';
import 'package:receive_intent/receive_intent.dart';
import 'package:rxdart/utils.dart';

import '../../../core/arch/bloc_widget.dart';
import '../../ad_banner/presentation/ad_banner_widget.dart';
import '../../call_log/presentation/call_log_page.dart';
import '../../chat_apps/presentation/chat_apps_widget.dart';
import '../../history/presentation/history_page.dart';
import '../../phone/presentation/phone_field_widget.dart';
import '../../region/domain/entity/region.dart';
import '../../region/presentation/region_picker_page.dart';
import '../../region/region_mediator.dart';
import '../../shared/presentation/share_service.dart';
import '../../top_banner/presentation/top_banner_widget.dart';
import 'home_bloc.dart';
import 'home_state.dart';
import 'widgets/tab_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = 'Zapify';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with BlocStateWidget<HomePage, HomeBloc, HomeEvent, void> {
  late final ShareService _shareService = ShareService();
  final _sub = CompositeSubscription();

  Future<void> _init() async {
    _sub.add(
      _shareService.stream().listen(_handleSharedPhoneNumber),
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
  Widget buildState(BuildContext context, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBannerWidget(),
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
      bottomNavigationBar: const AdBannerWidget(),
    );
  }

  @override
  FutureOr<void> handleEvent(BuildContext context, HomeEvent event) {
    event.when(
      navigateToRegionPicker: (current) =>
          _navigateToRegionPicker(context, current),
    );
  }

  Future<void> _navigateToRegionPicker(
    BuildContext context,
    Region region,
  ) async {
    final bloc = context.read<RegionMediator>();

    final route = MaterialPageRoute<Region>(
      fullscreenDialog: true,
      settings: const RouteSettings(name: 'RegionPicker'),
      builder: (_) => RegionPicker(selected: region),
    );

    final selectedRegion = await Navigator.of(context).push<Region>(route);

    if (selectedRegion != null) {
      bloc.onRegionSelected(selectedRegion);
    }
  }

  void _handleSharedPhoneNumber(Intent intent) {
    final phoneNumber = intent.data;
    if (phoneNumber != null && phoneNumber.startsWith('tel:')) {
      analytics.intentHandled('phone_number_received');
      context
          .read<HomeBloc>()
          .onPhoneReceivedFromIntent(phoneNumber.replaceFirst('tel:', ''))
          .catchError((_) {
        final obfuscatedNumber =
            phoneNumber.replaceAll('*', '\\*').replaceAll(RegExp('[0-9]'), '*');
        Log.e('invalid phone number: $obfuscatedNumber');
      });
    }
  }
}
