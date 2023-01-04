import 'package:error_handler/error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_plus/http_client_plus.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../core/data/network/user_agent_interceptor.dart';
import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import '../../core/ext/context.dart';
import 'data/db.dart';
import 'data/repository/history_repository.dart';
import 'domain/repository/history_repository.dart';

void sharedModule() {
  registerSingleton<ErrorMessageResolver>(
    () => CompositeErrorMessageResolver(
      onUnknownError: (context) => ResolvedActionableFailure(
        message: context.strings.unknowErrorMessage,
        action: context.strings.unknowErrorAction,
      ),
    ),
  );

  registerSingleton(() => PhoneNumberUtil());

  registerSingleton<IHistoryRepository>(
    () => HistoryRepository(
      db: get(),
    ),
  );

  registerSingleton<Future<Database>>(
    () => getDatabase(),
    dispose: (param) => param.then((db) => db.close()),
  );

  registerSingleton<Future<BriteDatabase>>(
    () => getDatabase().then(
      (db) => BriteDatabase(db, logger: kDebugMode ? print : null),
    ),
    dispose: (param) => param.then((db) => db.close()),
  );

  registerSingleton<http.Client>(
    () => InterceptableClient.withDefaultInterceptors(interceptors: [
      UserAgentInterceptor(),
    ]),
  );
}
