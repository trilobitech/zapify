import 'dart:async';

typedef ChatAppLauncher = FutureOr<void> Function(String phoneNumber);

abstract class ChatAppsMediator {
  Future<void> launch(String uriTemplate);
}
