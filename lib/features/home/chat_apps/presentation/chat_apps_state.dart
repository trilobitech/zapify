import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../chat_app/domain/entity/chat_app.dart';

part 'chat_apps_state.freezed.dart';

@freezed
class ChatAppsState with _$ChatAppsState implements IState {
  factory ChatAppsState.initial() = _ChatAppsStateInitial;

  factory ChatAppsState(Iterable<ChatApp> entries) = _ChatAppsStateSuccess;
}

@freezed
class ChatAppsAction with _$ChatAppsAction implements IAction {
  factory ChatAppsAction.select(ChatApp entry) = _ChatAppsActionSelect;
  factory ChatAppsAction.showFailureMessage(ChatApp app) =
      _ChatAppsActionShowFailureMessage;
}
