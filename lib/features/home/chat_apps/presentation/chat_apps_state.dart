import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/chat_app.dart';

part 'chat_apps_state.freezed.dart';

@freezed
class ChatAppsState with _$ChatAppsState implements IState {
  factory ChatAppsState.initial() = _ChatAppsStateInitial;

  factory ChatAppsState(Iterable<ChatApp> entries) = _ChatAppsStateLoaded;
}

@freezed
class ChatAppsAction with _$ChatAppsAction implements IAction {
  factory ChatAppsAction.select(ChatApp entry) = _ChatAppsActionSelected;
  factory ChatAppsAction.showChatFailedMessage(ChatApp app) =
      _ChatAppsActionNavigate;
}
