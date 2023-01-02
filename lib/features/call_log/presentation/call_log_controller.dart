import 'package:logger_plus/logger_plus.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/exception/no_call_log_access_permission.dart';
import '../domain/usecase/get_call_log.dart';
import '../domain/usecase/request_call_log_permission.dart';
import 'call_log_state.dart';

const _shimmerListSize = 10;

class CallLogController {
  CallLogController({
    required this.getCallLog,
    required this.requestCallLogPermission,
  }) {
    _load();
  }

  final GetCallLogUseCase getCallLog;
  final RequestCallLogPermissionUseCase requestCallLogPermission;

  late final BehaviorSubject<CallLogState> _state = BehaviorSubject();

  Stream<CallLogState> get state => _state;

  _load() async {
    _state.add(CallLogState.loading(_shimmerListSize));

    final state = await getCallLog()
        .then((items) => items.map((e) => CallItem.from(e)))
        .then((items) => CallLogState(entries: items))
        .catchError(_onError);

    _state.add(state);
  }

  Future<void> retry() async {
    await requestCallLogPermission();
    _load();
  }

  CallLogState _onError(error, stack) {
    if (error is! NoCallLogAccessPermission) Log.e(error, stack);
    return CallLogState.error(error);
  }
}
