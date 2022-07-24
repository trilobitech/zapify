import 'package:zapify/features/shared/domain/entity/history_entry.dart';

abstract class IHistoryRepository {
  Stream<List<HistoryEntry>> getAll();

  Future add(String phoneNumber);

  Future remove(HistoryEntry entry);

  Future restore(HistoryEntry entry);
}
