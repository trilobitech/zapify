import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../chat_app/domain/entity/chat_app.dart';
import '../../phone/domain/entities/phone_number.dart';

part 'chat_apps_state.freezed.dart';

@freezed
sealed class ChatAppsState with _$ChatAppsState implements IState {
  factory ChatAppsState.initial() = InitialChatAppsState;

  factory ChatAppsState(Iterable<ChatApp> entries) = LoadedChatAppsState;
}

@freezed
sealed class ChatAppsAction with _$ChatAppsAction implements IAction {
  factory ChatAppsAction.select(ChatApp entry, PhoneNumberValue? phoneNumber) =
      SelectEntryChatAppsAction;

  factory ChatAppsAction.showFailureMessage(ChatApp app) =
      ShowFailureMessageChatAppsAction;

  factory ChatAppsAction.showInvalidPhoneNumberError(
    ChatApp app,
    PhoneNumberValue phoneNumber,
  ) = ShowInvalidPhoneNumberErrorChatAppsAction;
}
