import 'package:rxdart/subjects.dart';
import 'package:zapfy/features/home/domain/entity/history_entry.dart';
import 'package:zapfy/features/home/domain/repository/history_repository.dart';

class HistoryRepository implements IHistoryRepository {
  final BehaviorSubject<List<HistoryEntry>> stream = BehaviorSubject.seeded([]);

  @override
  Stream<List<HistoryEntry>> getAll() {
    return stream;
  }

  @override
  Future save(HistoryEntry history) async {
    stream.add([history, ...stream.value]);
  }
}
