import 'package:phone_number/phone_number.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/shared/data/db.dart';
import 'package:zapfy/features/shared/data/repository/history_repository.dart';
import 'package:zapfy/features/shared/data/repository/region_repository.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';
import 'package:zapfy/features/shared/domain/repository/region_repository.dart';

void sharedModule() {
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
    () => getDatabase().then((db) => BriteDatabase(db)),
    dispose: (param) => param.then((db) => db.close()),
  );
}
