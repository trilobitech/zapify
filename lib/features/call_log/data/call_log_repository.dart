import 'package:call_log/call_log.dart' as plugin;
import 'package:collection/collection.dart';

import '../domain/entity/call.dart';
import '../domain/repository/call_log.dart';

class CallLogRepositoryImpl extends CallLogRepository {
  @override
  Future<Iterable<CallEntity>> getAll() async {
    final entries = await plugin.CallLog.get();
    return entries.map((e) => e.toDomain()).whereNotNull();
  }
}

extension _CallLogEntryExt on plugin.CallLogEntry {
  CallEntity? toDomain() {
    final type = callType?.toDomain();
    final number = formattedNumber ?? this.number ?? '';
    final timestamp = this.timestamp ?? 0;
    if (type == null || number.isEmpty || timestamp == 0) return null;

    return CallEntity(
      name: name?.isNotEmpty == true ? name : null,
      number: number,
      date: DateTime.fromMillisecondsSinceEpoch(timestamp),
      type: type,
    );
  }
}

extension _CallTypeExt on plugin.CallType {
  CallType? toDomain() {
    switch (this) {
      case plugin.CallType.incoming:
      case plugin.CallType.wifiIncoming:
        return CallType.income;
      case plugin.CallType.outgoing:
      case plugin.CallType.wifiOutgoing:
        return CallType.outcome;
      case plugin.CallType.missed:
        return CallType.missed;
      case plugin.CallType.rejected:
        return CallType.rejected;
      case plugin.CallType.blocked:
        return CallType.blocked;
      default:
        return null;
    }
  }
}
