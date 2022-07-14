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
        .mapToList(
          (row) => HistoryEntry(
            phoneNumber: row['number'],
            at: DateTime.parse('${row['last_usage_at']}Z'),
          ),
        );
  }

  @override
  Future add(String phoneNumber) async {
    final db = await this.db;
    db.rawInsert(
      '''
      INSERT OR REPLACE INTO historic(number, last_usage_at)
      VALUES("$phoneNumber", CURRENT_TIMESTAMP)
      ''',
    );
    db.sendTableTrigger(['historic']);
  }
}
