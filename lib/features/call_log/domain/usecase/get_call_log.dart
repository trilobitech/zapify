import '../entity/call.dart';
import '../exception/no_call_log_access_permission.dart';
import '../repository/call_log.dart';
import 'has_call_log_access_permission.dart';

class GetCallLogUseCase {
  GetCallLogUseCase({
    required this.hasCallLogAccessPermission,
    required this.repository,
  });

  final HasCallLogAccessPermissionUseCase hasCallLogAccessPermission;
  final CallLogRepository repository;

  Future<Iterable<CallEntity>> call() async {
    if (!await hasCallLogAccessPermission()) throw NoCallLogAccessPermission();

    return repository.getAll();
  }
}
