import 'package:sqlbrite/sqlbrite.dart';

import '../../../../common/config/local_config.dart';
import '../../domain/entity/history.dart';
import '../../domain/repository/history_repository.dart';

class HistoryRepository implements IHistoryRepository {
  HistoryRepository({
    required this.db,
  });

  final Future<BriteDatabase> db;

  @override
  Stream<List<HistoryEntry>> getAll() => db.asStream().asyncExpand(
        (db) => db
            .createQuery(
              'historic',
              orderBy: 'last_usage_at DESC',
            )
            .mapToList(HistoryEntry.fromJson),
      );

  @override
  Future<void> add(String phoneNumber) async {
    final db = await this.db;
    await db.rawInsert(
      '''
      INSERT OR REPLACE INTO historic(number, last_usage_at)
      VALUES(?, strftime('%Y-%m-%dT%H:%M:%fZ', 'now'))
      ''',
      [phoneNumber],
    );
    db.sendTableTrigger(['historic']);
    _updateHistoricSize(db);
  }

  @override
  Future<void> remove(HistoryEntry entry) async {
    final db = await this.db;
    await db.delete(
      'historic',
      where: 'number = ?',
      whereArgs: [entry.phoneNumber],
    );
    _updateHistoricSize(db);
  }

  @override
  Future<void> restore(HistoryEntry entry) async {
    final db = await this.db;
    await db.insert(
      'historic',
      {
        'number': entry.phoneNumber,
        'last_usage_at': entry.lastUsageAt.toIso8601String(),
        'created_at': entry.createdAt.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    _updateHistoricSize(db);
  }

  Future<void> _updateHistoricSize(BriteDatabase db) => db
      .rawQuery(
        'SELECT COUNT(number) AS historic_size FROM historic',
      )
      .then<int>((newSize) => newSize.first['historic_size'] as int)
      .then(LocalConfig.historicSize.set);
}
