import 'dart:async';

abstract class ChatAppsMediator {
  Future<void> launch(String uriTemplate);
}
