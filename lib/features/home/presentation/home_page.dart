import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart' hide Intent;
import 'package:logger/logger.dart';
import 'package:receive_intent/receive_intent.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/features/history/presentation/history_page.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';
import 'package:zapify/features/home/presentation/home_controller.dart';
import 'package:zapify/features/home/presentation/home_state.dart';
import 'package:zapify/features/home/presentation/widgets/ad_banner_widget.dart';
import 'package:zapify/features/home/presentation/widgets/chat_apps_widget.dart';
import 'package:zapify/features/home/presentation/widgets/phone_field_widget.dart';
import 'package:zapify/features/home/presentation/widgets/top_banner_widget.dart';
import 'package:zapify/features/region/presentation/region_picker_page.dart';
import 'package:zapify/features/shared/domain/entity/region.dart';
import 'package:zapify/features/shared/presentation/share_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = 'Zapify';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller = inject();

  late FocusNode _phoneNumberFocus;
  late final ShareService _shareService = ShareService();
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _phoneNumberFocus = FocusNode();
    _sub = _shareService.stream().listen(_handleSharedPhoneNumber);
  }

  @override
  void dispose() {
    _sub?.cancel();
    _phoneNumberFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: controller.bannerViewState,
            initialData: BannerViewState.none(),
            builder: _handleBannerType,
          ),
          StreamBuilder(
            stream: controller.phoneFieldState,
            builder: _buildPhoneField,
          ),
          StreamBuilder(
            stream: controller.chatAppsState,
            builder: _buildChatAppLaunchers,
          ),
          Expanded(
            child: HistoryPage(
              onEntryTap: controller.onPhoneNumberSelected,
            ),
          ),
        ],
      ),
      bottomNavigationBar: FutureBuilder<AdBannerViewState>(
        initialData: AdBannerViewState.none(),
        future: controller.adBannerState,
        builder: _buildAdBanner,
      ),
    );
  }

  Widget _buildPhoneField(
    BuildContext context,
    AsyncSnapshot<PhoneFieldViewState> snapshot,
  ) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return PhoneFieldWidget(
        region: state.selectedRegion,
        onRegionPressed: (region) => _onRegionPressed(context, region),
        controller: state.controller,
        focusNode: _phoneNumberFocus,
        error: state.error,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  Widget _buildChatAppLaunchers(
    BuildContext context,
    AsyncSnapshot<ChatAppsViewState> snapshot,
  ) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return ChatAppsWidget(
        chatApps: state.chatApps,
        onChatAppPressed: (chatApp) => _onChatAppPressed(context, chatApp),
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  _onRegionPressed(BuildContext context, Region? region) async {
    analytics.buttonPressed('open_region_picker');
    dismissKeyboard(context);

    final route = MaterialPageRoute<Region>(
      fullscreenDialog: true,
      settings: const RouteSettings(name: 'RegionPicker'),
      builder: (_) => RegionPicker(selected: region),
    );

    final selectedRegion = await Navigator.of(context).push<Region>(route);

    if (selectedRegion != null) {
      controller.onRegionSelected(selectedRegion);
    }
    _phoneNumberFocus.requestFocus();
  }

  _onChatAppPressed(BuildContext context, ChatApp chatApp) async {
    analytics.buttonPressed(
      'launch_chat_app',
      properties: {'app_launched': chatApp.name},
    );
    if (await controller.onChatAppPressed(chatApp)) {
      dismissKeyboard(context);
    }
  }

  void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();

  Widget _handleBannerType(
    BuildContext context,
    AsyncSnapshot<BannerViewState> snapshot,
  ) {
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
      return Container();
    }
    final data = snapshot.requireData;
    return data.when(
      (type) => TopBanner(
        type: type,
        onActionTap: controller.onTopBannerActionTap,
      ),
      none: () => Container(),
    );
  }

  Widget _buildAdBanner(
    BuildContext context,
    AsyncSnapshot<AdBannerViewState> snapshot,
  ) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return state.when((unitId) => AdBannerWidget(unitId: unitId),
          none: () => const SizedBox.shrink());
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return const SizedBox.shrink();
  }

  void _handleSharedPhoneNumber(Intent intent) {
    final phoneNumber = intent.data;
    if (phoneNumber != null && phoneNumber.startsWith('tel:')) {
      analytics.intentHandled('phone_number_received');
      controller
          .onPhoneNumberReceived(phoneNumber.replaceFirst('tel:', ''))
          .catchError((_) {
        final obfuscatedNumber =
            phoneNumber.replaceAll('*', '\\*').replaceAll(RegExp('[0-9]'), '*');
        logError('invalid phone number: $obfuscatedNumber');
      });
    }
  }
}
