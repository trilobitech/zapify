import '../entity/history_entry.dart';

abstract class IHistoryRepository {
  Stream<List<HistoryEntry>> getAll();

  Future<void> add(String phoneNumber);

  Future<void> remove(HistoryEntry entry);

  Future<void> restore(HistoryEntry entry);
}
