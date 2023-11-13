library flavor_main;

import 'package:logging/logging.dart';
import 'package:logify/logify.dart';
import 'package:zapify_flavor/zapify_flavor.dart';

Future<void> initFlavor() async {
  assert(() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(DebugLogRecorder());
    return true;
  }());

  await ZapifyFlavorInitializer().init();
}
