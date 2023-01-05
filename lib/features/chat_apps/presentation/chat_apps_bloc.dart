import 'package:analytics/analytics.dart';

import '../../../core/arch/bloc_controller.dart';
import '../domain/entity/chat_app.dart';
import '../domain/usecase/get_chat_apps.dart';
import 'chat_apps_state.dart';

class ChatAppsBloc extends BlocController<ChatAppsEvent, ChatAppsState> {
  ChatAppsBloc({
    required GetChatAppsUseCase getChatApps,
  })  : _getChatApps = getChatApps,
        super(ChatAppsState.initial());

  final GetChatAppsUseCase _getChatApps;

  @override
  Future<void> load() async {
    subscriptions.add(
      _getChatApps().map((entries) => ChatAppsState(entries)).listen(emit),
    );
  }

  void selected(ChatApp entry) {
    analytics.buttonPressed(
      'launch_chat_app',
      properties: {'app_launched': entry.name},
    );
    event(ChatAppsEvent.select(entry));
  }
}
