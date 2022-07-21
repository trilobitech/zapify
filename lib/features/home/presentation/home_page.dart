import 'package:flutter/material.dart';
import 'package:zapfy/config/remote_config.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/firebase.dart';
import 'package:zapfy/core/logger.dart';
import 'package:zapfy/features/history/presentation/history_page.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/presentation/home_controller.dart';
import 'package:zapfy/features/home/presentation/home_state.dart';
import 'package:zapfy/features/home/presentation/widgets/ad_banner_widget.dart';
import 'package:zapfy/features/home/presentation/widgets/chat_apps_widget.dart';
import 'package:zapfy/features/home/presentation/widgets/phone_field_widget.dart';
import 'package:zapfy/features/region/presentation/region_picker_page.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = 'Zapfy';
  late final HomeController controller = inject();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: controller.phoneFieldState(),
            builder: _buildPhoneField,
          ),
          StreamBuilder(
            stream: controller.chatAppsState(),
            builder: _buildChatAppLaunchers,
          ),
          Expanded(
            child: HistoryPage(
              onEntryTap: _onHistoryEntryTap,
            ),
          ),
        ],
      ),
      bottomNavigationBar: AdBannerWidget(
        unitId: RemoteConfig.homeBannerUnitId.get(),
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
    analytics.logButtonPressed('open_region_picker');
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
  }

  _onChatAppPressed(BuildContext context, ChatApp chatApp) async {
    analytics.logButtonPressed(
      'launch_chat_app',
      {'app_launched': chatApp.name},
    );
    if (await controller.onChatAppPressed(chatApp)) {
      dismissKeyboard(context);
    }
  }

  _onHistoryEntryTap(String phoneNumber) {
    analytics.logButtonPressed('select_phone_from_history');
    controller.onPhoneNumberSelected(phoneNumber);
  }

  void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();
}
