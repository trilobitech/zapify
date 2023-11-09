import 'package:analytics/analytics.dart';
import 'package:logify/logify.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../chat_app/domain/entity/chat_app.dart';
import '../../../chat_app/domain/exception/chat_app_not_found_error.dart';
import '../../../chat_app/domain/get_enabled_chat_apps.dart';
import 'chat_apps_state.dart';

class ChatAppsBloc extends StateActionBloc<ChatAppsState, ChatAppsAction> {
  ChatAppsBloc({
    required GetEnabledChatAppsUseCase getEnabledChatApps,
    required IAnalytics analytics,
  })  : _getEnabledChatApps = getEnabledChatApps,
        _analytics = analytics,
        super(ChatAppsState.initial());

  final GetEnabledChatAppsUseCase _getEnabledChatApps;
  final IAnalytics _analytics;

  @override
  Future<void> load() async {
    setStateFrom(
      _getEnabledChatApps().map(_mapToState),
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
      sendAction(ChatAppsAction.showFailureMessage(entry));
    } else {
      Log.e(error);
    }
  }

  ChatAppsState _mapToState(Iterable<ChatApp> entries) =>
      ChatAppsState(entries);
}
