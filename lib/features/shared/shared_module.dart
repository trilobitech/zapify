import 'package:error_handler/error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_plus/http_client_plus.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapify/core/data/network/user_agent_interceptor.dart';
import 'package:zapify/core/di/definition.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/core/ext/context.dart';
import 'package:zapify/features/shared/data/db.dart';
import 'package:zapify/features/shared/data/repository/history_repository.dart';
import 'package:zapify/features/shared/data/repository/region_repository.dart';
import 'package:zapify/features/shared/domain/repository/history_repository.dart';
import 'package:zapify/features/shared/domain/repository/region_repository.dart';

void sharedModule() {
  registerSingleton<ErrorMessageResolver>(
    () => CompositeErrorMessageResolver(
      onUnknownError: (context) => context.strings.unknowErrorMessage,
    ),
  );

  registerSingleton(() => PhoneNumberUtil());

  registerSingleton<IHistoryRepository>(
    () => HistoryRepository(
      db: get(),
    ),
  );

  registerSingleton<IRegionRepository>(
    () => RegionRepository(
      plugin: get(),
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
