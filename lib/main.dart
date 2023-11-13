import 'dart:async';

import 'package:flavor_main/flavor_main.dart';
import 'package:flutter/material.dart';
import 'package:logify/logify.dart';

import 'app.dart';
import 'modules.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupApp();

      runApp(const App());
    },
    Log.wtf,
  );
}

Future<void> setupApp() async {
  FlutterError.onError = Log.wtf;
  await initFlavor();
  unawaited(loadModules());
}
