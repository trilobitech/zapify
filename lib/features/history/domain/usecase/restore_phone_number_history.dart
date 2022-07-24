import 'package:zapify/features/shared/domain/entity/history_entry.dart';
import 'package:zapify/features/shared/domain/repository/history_repository.dart';

class RestorePhoneNumberHistory {
  RestorePhoneNumberHistory({
    required this.repository,
  });

  IHistoryRepository repository;

  call(HistoryEntry entry) => repository.restore(entry);
}
