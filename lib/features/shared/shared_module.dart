import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapify/config/defaults.dart';
import 'package:zapify/config/storage/impl/firebase_storage.dart';
import 'package:zapify/config/storage/impl/preferences_storage.dart';
import 'package:zapify/config/storage/key_value_storage.dart';
import 'package:zapify/core/data/network/api_client.dart';
import 'package:zapify/core/di/definition.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/core/error_handler/composite_error_message_resolver.dart';
import 'package:zapify/core/error_handler/error_message_resolver.dart';
import 'package:zapify/features/shared/data/db.dart';
import 'package:zapify/features/shared/data/remote_config.dart';
import 'package:zapify/features/shared/data/repository/history_repository.dart';
import 'package:zapify/features/shared/data/repository/region_repository.dart';
import 'package:zapify/features/shared/domain/repository/history_repository.dart';
import 'package:zapify/features/shared/domain/repository/region_repository.dart';

void sharedModule() {
  registerSingletonAsync<FirebaseRemoteConfig>(getRemoteConfig);

  registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

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

  registerSingleton<LocalConfigStorage>(
    () => PreferencesStorage(
      prefs: get(),
      localConfigDefaults: localConfigDefaults,
    ),
  );

  registerSingleton<RemoteConfigStorage>(
    () => FirebaseStorage(
      remoteConfig: get(),
    ),
  );
}
