import '../entity/history.dart';
import '../repository/history_repository.dart';

class RestorePhoneNumberHistoryUseCase {
  RestorePhoneNumberHistoryUseCase({required this.repository});

  IHistoryRepository repository;

  Future<void> call(HistoryEntry entry) => repository.restore(entry);
}
