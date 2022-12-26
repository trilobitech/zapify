import 'package:flutter/material.dart';

import '../../config/remote_config.dart';
import '../home/presentation/widgets/tab_list_view.dart';

class CallLogTabPage extends StatelessWidget implements MaybeAvailableTabPage {
  CallLogTabPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.call;

  @override
  String buildTitle(BuildContext context) => 'Chamadas';

  @override
  late final Future<bool> isTabAvailable =
      RemoteConfig.isCallLogTabEnabled.get();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Empty history'),
    );
  }
}
