import '../entity/history.dart';
import '../repository/history_repository.dart';

class GetPhoneNumberHistoryUseCase {
  GetPhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Stream<List<HistoryEntry>> call() => repository.getAll();
}
