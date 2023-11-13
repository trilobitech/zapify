import 'package:di_core/di_core.dart';
import 'package:error_adapter/error_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:phone_number/phone_number.dart';
import 'package:resources/strings.dart';
import 'package:sqlbrite/sqlbrite.dart';

import 'data/db.dart';
import 'widgets/feedback_view.dart';

void commonModule() {
  registerFactoryParam<FailureAdapter, ErrorConverterRegistry, void>(
    (registry, _) => FailureAdapter(
      registry: registry,
      fallback: (context, _) => ErrorFeedback(
        message: context.strings.unknowErrorMessage,
        primaryButtonText: context.strings.unknowErrorAction,
      ),
    ),
  );

  registerSingleton(() => PhoneNumberUtil());

  registerSingletonAsync<Database>(
    getDatabase,
    dispose: (db) async => db.close(),
  );

  registerSingletonAsync<BriteDatabase>(
    () async => BriteDatabase(
      await lazyGet(),
      logger: kDebugMode ? print : null,
    ),
    dispose: (db) async => db.close(),
  );
}
