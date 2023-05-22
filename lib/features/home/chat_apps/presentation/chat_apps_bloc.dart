import 'package:analytics/analytics.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/chat_app.dart';
import '../domain/exception/open_chat_app_error.dart';
import '../domain/usecase/get_chat_apps.dart';
import 'chat_apps_state.dart';

class ChatAppsBloc extends StateActionBloc<ChatAppsState, ChatAppsAction> {
  ChatAppsBloc({
    required GetChatAppsUseCase getChatApps,
    required IAnalytics analytics,
  })  : _getChatApps = getChatApps,
        _analytics = analytics,
        super(ChatAppsState.initial());

  final GetChatAppsUseCase _getChatApps;
  final IAnalytics _analytics;

  @override
  Future<void> load() async {
    setStateFrom(
      _getChatApps().map(_mapToState),
    );
  }

  void selected(ChatApp entry) {
    _analytics.buttonPressed(
      'launch_chat_app',
      properties: {'app_launched': entry.name},
    );
    sendAction(ChatAppsAction.select(entry));
  }

  void selectFailed(ChatApp entry, Object error) {
    if (error is ChatAppNotFoundError) {
      sendAction(ChatAppsAction.showChatFailedMessage(entry));
    } else {
      Log.e(error);
    }
  }

  ChatAppsState _mapToState(List<ChatApp> entries) => ChatAppsState(entries);
}
