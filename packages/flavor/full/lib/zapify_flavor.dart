library zapify_flavor;

import 'dart:async';

import 'package:domain_core/domain_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flavor_core/flavor_core.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'src/logger.dart';
import 'src/module.dart';

class ZapifyFlavorInitializer extends IFlavorInitializer {
  @override
  Future<void> init() async {
    logger.config('Initializing flavor');
    final completer = Completer();

    await Firebase.initializeApp(
        /* options: DefaultFirebaseOptions.currentPlatform, */);

    assert(() {
      // for some reason config set on native android not working well
      completer.complete(
        Future.wait([
          FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false),
          FirebasePerformance.instance.setPerformanceCollectionEnabled(false),
        ]),
      );
      return true;
    }());

    if (kReleaseMode) {
      Logger.root.onRecord.listen(_CrashlyticsLogRecorder());
    }

    unawaited(loadModules());
  }
}

class _CrashlyticsLogRecorder {
  void call(LogRecord record) {
    if (record.level >= Level.SEVERE && record.error is! NonReportableError) {
      unawaited(
        FirebaseCrashlytics.instance.recordError(
          record.error,
          record.stackTrace,
          reason: record.message,
          fatal: record.level > Level.SEVERE,
        ),
      );
    }
  }
}
