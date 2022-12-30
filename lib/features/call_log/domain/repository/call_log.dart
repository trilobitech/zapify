import '../entity/call.dart';

abstract class CallLogRepository {
  Future<Iterable<CallEntity>> getAll();
}
