import 'dart:async';

abstract class HistoryMediator {
  FutureOr<void> onPhoneReceivedFromHistory(String phoneNumber);
}
