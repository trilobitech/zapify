import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:phone_number/phone_number.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapfy/core/data/network/api_client.dart';
import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/error_handler/composite_error_message_resolver.dart';
import 'package:zapfy/core/error_handler/error_message_resolver.dart';
import 'package:zapfy/features/shared/data/db.dart';
import 'package:zapfy/features/shared/data/remote_config.dart';
import 'package:zapfy/features/shared/data/repository/history_repository.dart';
import 'package:zapfy/features/shared/data/repository/region_repository.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';
import 'package:zapfy/features/shared/domain/repository/region_repository.dart';

void sharedModule() {
  registerSingleton<ErrorMessageResolver>(
    () => CompositeErrorMessageResolver([]),
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
    () => ApiClient.withDefaultInterceptors(),
  );

  registerSingletonAsync<RemoteConfig>(getRemoteConfig);
}
