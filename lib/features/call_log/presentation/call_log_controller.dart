import 'package:rxdart/rxdart.dart';

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
        .catchError((error, stack) => CallLogState.error(error));

    _state.add(state);
  }

  Future<void> retry() async {
    await requestCallLogPermission();
    _load();
  }
}
