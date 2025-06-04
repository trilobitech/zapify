import 'dart:async';

import 'domain/entity/history.dart';

abstract class HistoryMediator {
  FutureOr<void> onPhoneReceivedFromHistory(HistoryEntry entry);
}
