import 'package:flutter/material.dart';
import 'package:zapfy/core/logger.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/entity/region.dart';
import 'package:zapfy/features/home/presentation/widgets/chat_app_launcher_widget.dart';
import 'package:zapfy/features/home/presentation/widgets/phone_field_widget.dart';
import 'package:zapfy/features/home/presentation/home_controller.dart';
import 'package:zapfy/features/home/presentation/home_state.dart';
import 'package:zapfy/core/di/inject.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = 'Zapfy';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller = inject();

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
            stream: controller.phoneFieldState(),
            builder: (_, AsyncSnapshot<PhoneFieldViewState> snapshot) =>
                _buildPhoneField(snapshot),
          ),
          FutureBuilder(
            future: controller.chatAppsState(),
            builder: (_, AsyncSnapshot<ChatAppsViewState> snapshot) =>
                _buildChatAppLaunchers(snapshot),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField(AsyncSnapshot<PhoneFieldViewState> snapshot) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return PhoneFieldWidget(
        region: state.selectedRegion,
        onRegionPressed: _onRegionPressed,
        controller: state.controller,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  Widget _buildChatAppLaunchers(AsyncSnapshot<ChatAppsViewState> snapshot) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return ChatAppLauncherWidget(
        chatApps: state.chatApps,
        onChatAppPressed: _onChatAppPressed,
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  _onRegionPressed(Region? region) {
    // TODO: navigate to region picker
  }

  _onChatAppPressed(ChatApp chatApp) {
    controller.onChatAppPressed(chatApp);
  }
}
