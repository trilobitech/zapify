import 'package:zapfy/features/shared/domain/entity/history_entry.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

class GetPhoneNumberHistoryUseCase {
  GetPhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Stream<Set<HistoryEntry>> call() => repository.getAll();
}
