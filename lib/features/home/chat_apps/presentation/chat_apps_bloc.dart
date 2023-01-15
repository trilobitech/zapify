import 'package:analytics/analytics.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/chat_app.dart';
import '../domain/usecase/get_chat_apps.dart';
import 'chat_apps_state.dart';

class ChatAppsBloc extends StateActionBloc<ChatAppsState, ChatAppsAction> {
  ChatAppsBloc({
    required GetChatAppsUseCase getChatApps,
  })  : _getChatApps = getChatApps,
        super(ChatAppsState.initial());

  final GetChatAppsUseCase _getChatApps;

  @override
  Future<void> load() async {
    setStateFrom(
      _getChatApps().map(_mapToState),
    );
  }

  void selected(ChatApp entry) {
    analytics.buttonPressed(
      'launch_chat_app',
      properties: {'app_launched': entry.name},
    );
    sendAction(ChatAppsAction.select(entry));
  }

  ChatAppsState _mapToState(List<ChatApp> entries) => ChatAppsState(entries);
}
