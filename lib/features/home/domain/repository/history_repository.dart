import 'package:zapfy/features/home/domain/entity/history_entry.dart';

abstract class IHistoryRepository {
  Stream<List<HistoryEntry>> getAll();

  Future save(HistoryEntry history);
}
