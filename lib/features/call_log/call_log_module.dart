import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'data/call_log_repository.dart';
import 'domain/repository/call_log.dart';
import 'domain/usecase/get_call_log.dart';
import 'domain/usecase/has_call_log_access_permission.dart';
import 'domain/usecase/request_call_log_permission.dart';
import 'presentation/call_log_controller.dart';

void callLogModule() {
  registerFactory(
    () => CallLogController(
      getCallLog: get(),
      requestCallLogPermission: get(),
    ),
  );

  registerFactory(
    () => GetCallLogUseCase(
      hasCallLogAccessPermission: get(),
      repository: get(),
    ),
  );

  registerFactory(
    () => HasCallLogAccessPermissionUseCase(),
  );

  registerFactory(
    () => RequestCallLogPermissionUseCase(),
  );

  registerFactory<CallLogRepository>(
    () => CallLogRepositoryImpl(),
  );
}
