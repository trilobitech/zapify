import 'package:zapify/features/shared/domain/entity/history_entry.dart';
import 'package:zapify/features/shared/domain/repository/history_repository.dart';

class GetPhoneNumberHistoryUseCase {
  GetPhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Stream<List<HistoryEntry>> call() => repository.getAll();
}
