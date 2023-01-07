import 'package:analytics/analytics.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';

import '../../../common/arch/bloc_controller.dart';
import '../domain/exception/no_call_log_access_permission.dart';
import '../domain/usecase/get_call_log.dart';
import '../domain/usecase/request_call_log_permission.dart';
import 'call_log_state.dart';

const _shimmerListSize = 10;

class CallLogBloc extends BlocController<CallLogState, CallLogAction> {
  CallLogBloc({
    required GetCallLogUseCase getCallLog,
    required RequestCallLogPermissionUseCase requestCallLogPermission,
  })  : _getCallLog = getCallLog,
        _requestCallLogPermission = requestCallLogPermission,
        super(CallLogState.loading(_shimmerListSize));

  final GetCallLogUseCase _getCallLog;
  final RequestCallLogPermissionUseCase _requestCallLogPermission;

  @override
  @protected
  Future<void> load() async {
    final state = await _getCallLog()
        .then((items) => items.map((e) => CallEntry.from(e)))
        .then((items) => CallLogState(entries: items))
        .catchError(_onError);

    setState(state);
  }

  void selected(CallEntry item) {
    analytics.itemSelected('phone_from_call_log');
    sendAction(CallLogAction.select(item));
  }

  Future<void> retry() async {
    await _requestCallLogPermission();
    setState(CallLogState.loading(_shimmerListSize));
    load();
  }

  CallLogState _onError(error, stack) {
    if (error is! NoCallLogAccessPermission) Log.e(error, stack);
    return CallLogState.error(error);
  }
}
