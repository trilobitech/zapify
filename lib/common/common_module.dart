import 'package:error_handler/error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_plus/http_client_plus.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../common/ext/context.dart';
import '../di/definition.dart';
import 'data/db.dart';
import 'data/network/user_agent_interceptor.dart';

void commonModule() {
  registerSingleton<ErrorMessageResolver>(
    () => CompositeErrorMessageResolver(
      onUnknownError: (context) => ResolvedActionableFailure(
        message: context.strings.unknowErrorMessage,
        action: context.strings.unknowErrorAction,
      ),
    ),
  );

  registerSingleton(() => PhoneNumberUtil());

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
