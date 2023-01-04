import '../../../shared/domain/entity/history_entry.dart';
import '../../../shared/domain/repository/history_repository.dart';

class RemovePhoneNumberHistory {
  RemovePhoneNumberHistory({
    required this.repository,
  });

  IHistoryRepository repository;

  Future<void> call(HistoryEntry entry) => repository.remove(entry);
}
