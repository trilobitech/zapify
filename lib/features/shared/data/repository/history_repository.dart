import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapfy/features/shared/domain/entity/history_entry.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

class HistoryRepository implements IHistoryRepository {
  HistoryRepository({
    required this.db,
  });

  final Future<BriteDatabase> db;

  @override
  Stream<List<HistoryEntry>> getAll() async* {
    final db = await this.db;
    yield* db
        .createQuery(
          'historic',
          orderBy: 'last_usage_at DESC',
        )
        .mapToList((row) => HistoryEntry.fromJson(row));
  }

  @override
  Future add(String phoneNumber) async {
    final db = await this.db;
    await db.rawInsert(
      '''
      INSERT OR REPLACE INTO historic(number, last_usage_at)
      VALUES("$phoneNumber", strftime('%Y-%m-%dT%H:%M:%fZ', 'now'))
      ''',
    );
    db.sendTableTrigger(['historic']);
  }

  @override
  Future remove(HistoryEntry entry) async {
    final db = await this.db;
    await db.delete(
      'historic',
      where: 'number = ?',
      whereArgs: [entry.phoneNumber],
    );
  }

  @override
  Future restore(HistoryEntry entry) async {
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
  }
}
