import 'package:zapfy/features/shared/domain/entity/history_entry.dart';

abstract class IHistoryRepository {
  Stream<Set<HistoryEntry>> getAll();

  Future save(HistoryEntry history);
}
