import 'package:zapfy/features/home/domain/entity/history_entry.dart';
import 'package:zapfy/features/home/domain/repository/history_repository.dart';

class GetPhoneNumberHistory {
  GetPhoneNumberHistory({
    required this.repository,
  });

  IHistoryRepository repository;

  Stream<List<HistoryEntry>> call() => repository.getAll();
}
