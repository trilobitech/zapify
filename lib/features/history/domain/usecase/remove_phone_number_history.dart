import '../entity/history.dart';
import '../repository/history_repository.dart';

class RemovePhoneNumberHistoryUseCase {
  RemovePhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Future<void> call(HistoryEntry entry) => repository.remove(entry);
}
