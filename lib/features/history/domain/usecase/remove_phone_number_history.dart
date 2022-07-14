import 'package:zapfy/features/shared/domain/entity/history_entry.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

class RemovePhoneNumberHistory {
  RemovePhoneNumberHistory({
    required this.repository,
  });

  IHistoryRepository repository;

  call(HistoryEntry entry) => repository.remove(entry);
}
