import 'package:rxdart/subjects.dart';
import 'package:zapfy/features/shared/domain/entity/history_entry.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

class HistoryRepository implements IHistoryRepository {
  final BehaviorSubject<Set<HistoryEntry>> stream = BehaviorSubject.seeded({});

  @override
  Stream<Set<HistoryEntry>> getAll() {
    return stream;
  }

  @override
  Future save(HistoryEntry history) async {
    stream.add({history, ...stream.value});
  }
}
