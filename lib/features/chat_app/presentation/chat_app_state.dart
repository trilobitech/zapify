import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/chat_app.dart';

part 'chat_app_state.freezed.dart';

@freezed
sealed class ChatAppState with _$ChatAppState implements IState {
  factory ChatAppState({@Default([]) Iterable<ChatApp> enabled, @Default([]) Iterable<ChatApp> disabled}) =
      _ChatAppState;
}
