import '../../../shared/domain/entity/history_entry.dart';
import '../../../shared/domain/repository/history_repository.dart';

class RemovePhoneNumberHistory {
  RemovePhoneNumberHistory({
    required this.repository,
  });

  IHistoryRepository repository;

  call(HistoryEntry entry) => repository.remove(entry);
}
