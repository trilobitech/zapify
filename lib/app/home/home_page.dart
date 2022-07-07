import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:zapfy/app/home/chatapp_launcher/telegram_launcher.dart';
import 'package:zapfy/app/home/chatapp_launcher/whatsapp_launcher.dart';
import 'package:zapfy/app/home/models/region.dart';
import 'package:zapfy/app/home/widgets/app_launcher_widget.dart';
import 'package:zapfy/app/home/widgets/call_log_tab_page.dart';
import 'package:zapfy/app/home/widgets/phone_field_widget.dart';
import 'package:zapfy/app/home/widgets/recents_tab_page.dart';
import 'package:zapfy/app/home/widgets/region_picker.dart';
import 'package:zapfy/app/home/widgets/tabs.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final PhoneNumberUtil plugin = PhoneNumberUtil();

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Region? region;
  TextEditingController controller = TextEditingController();

  List<Region> _regions = [];

  void update() {
    setState(() {
      if (region != null) {
        controller = PhoneNumberEditingController.fromValue(
          widget.plugin,
          controller.value,
          regionCode: region!.code,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    selectCarrierRegionCodeIfNeeded();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhoneFieldWidget(
            region: region,
            onRegionPressed: onRegionPressed,
            controller: controller,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
          ),
          AppLauncherWidget(
            region: region,
            valueListenable: controller,
            chatAppLaunchers: [
              WhatsAppLauncher(),
              TelegramLauncher(),
            ],
          ),
          const Expanded(
            child: TabListView(
              tabs: [
                RecentsTabPage(),
                CallLogTabPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onRegionPressed(Region? current) async {
    dismissKeyboard(context);

    final regions = await getRegions();

    final route = MaterialPageRoute<Region>(
      fullscreenDialog: true,
      builder: (_) => RegionPicker(regions: regions),
    );

    final selectedRegion = await Navigator.of(context).push<Region>(route);

    if (selectedRegion != null) {
      print('Region selected: $selectedRegion');
      region = selectedRegion;
      update();
    }
  }

  void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();

  selectCarrierRegionCodeIfNeeded() async {
    if (region != null) return;
    region = await carrierRegionCode();
    update();
  }

  Future<Region> carrierRegionCode() async {
    final code = await widget.plugin
        .carrierRegionCode()
        .then((value) => value.toUpperCase());

    final allRegions = await getRegions();
    final regionInfo = allRegions.firstWhere(
      (element) => element.code == code,
      orElse: () => Region('BR', 55, 'Brazil'),
    );

    return Region(regionInfo.code, regionInfo.prefix, regionInfo.name);
  }

  Future<List<Region>> getRegions() async {
    if (_regions.isEmpty) {
      final regions = await widget.plugin.allSupportedRegions();

      _regions = regions
          .map((e) => Region(e.code, e.prefix, e.name))
          .toList(growable: false);

      _regions.sort((a, b) => a.name.compareTo(b.name));
    }
    return _regions;
  }
}
