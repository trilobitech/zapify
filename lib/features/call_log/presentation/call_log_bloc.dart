import 'package:analytics/analytics.dart';
import 'package:logify/logify.dart';
import 'package:meta/meta.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/exception/no_call_log_access_permission.dart';
import '../domain/usecase/get_call_log.dart';
import '../domain/usecase/request_call_log_permission.dart';
import 'call_log_state.dart';

const _shimmerListSize = 10;

class CallLogBloc extends StateActionBloc<CallLogState, CallLogAction> {
  CallLogBloc({
    required GetCallLogUseCase getCallLog,
    required RequestCallLogPermissionUseCase requestCallLogPermission,
    required IAnalytics analytics,
  }) : _getCallLog = getCallLog,
       _requestCallLogPermission = requestCallLogPermission,
       _analytics = analytics,
       super(CallLogState.loading(_shimmerListSize));

  final GetCallLogUseCase _getCallLog;
  final RequestCallLogPermissionUseCase _requestCallLogPermission;
  final IAnalytics _analytics;

  @override
  @protected
  Future<void> load() async {
    final state = await _getCallLog()
        .then((items) => items.map((e) => CallEntry.from(e)))
        .then(
          (items) =>
              items.isNotEmpty
                  ? CallLogState(entries: items)
                  : CallLogState.empty(),
        )
        .catchError(_onError);

    setState(state);
  }

  void selected(CallEntry item) {
    _analytics.itemSelected('phone_from_call_log');
    sendAction(CallLogAction.select(item));
  }

  void retry() async {
    await _requestCallLogPermission();
    setState(CallLogState.loading(_shimmerListSize));
    await load();
  }

  CallLogState _onError(error, stack) {
    if (error is! NoCallLogAccessPermissionError) Log.e(error, stack);
    return CallLogState.error(error);
  }
}
