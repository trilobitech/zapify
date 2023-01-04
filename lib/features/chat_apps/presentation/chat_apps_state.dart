import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entity/chat_app.dart';

part 'chat_apps_state.freezed.dart';

@freezed
class ChatAppsState with _$ChatAppsState {
  factory ChatAppsState.initial() = _ChatAppsStateInitial;

  factory ChatAppsState(Iterable<ChatApp> entries) = _ChatAppsStateLoaded;
}

@freezed
class ChatAppsEvent with _$ChatAppsEvent {
  factory ChatAppsEvent.select(ChatApp entry) = _ChatAppsEventSelected;
}
