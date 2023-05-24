import 'package:rxdart/rxdart.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/disable_chat_app.dart';
import '../domain/enable_chat_app.dart';
import '../domain/entity/chat_app.dart';
import '../domain/get_disabled_chat_apps.dart';
import '../domain/get_enabled_chat_apps.dart';
import 'chat_app_state.dart';

class ChatAppBloc extends StateBloc<ChatAppState> {
  ChatAppBloc({
    required GetEnabledChatAppsUseCase getEnabledChatApps,
    required GetDisabledChatAppsUseCase getDisabledChatApps,
    required DisableChatAppUseCase disableChatApp,
    required EnableChatAppUseCase enableChatApp,
  })  : _getEnabledChatApps = getEnabledChatApps,
        _getDisabledChatApps = getDisabledChatApps,
        _disableChatApp = disableChatApp,
        _enableChatApp = enableChatApp,
        super(ChatAppState());

  final GetEnabledChatAppsUseCase _getEnabledChatApps;
  final GetDisabledChatAppsUseCase _getDisabledChatApps;
  final DisableChatAppUseCase _disableChatApp;
  final EnableChatAppUseCase _enableChatApp;

  @override
  Future<void> load() async {
    setStateFrom(
      ZipStream.zip2(
        _getEnabledChatApps(),
        _getDisabledChatApps(),
        _mapToState,
      ),
    );
  }

  Future<void> disable(ChatApp chatApp) => _disableChatApp(chatApp);

  Future<void> enable(ChatApp chatApp) => _enableChatApp(chatApp);

  ChatAppState _mapToState(
    Iterable<ChatApp> enabled,
    Iterable<ChatApp> disabled,
  ) =>
      ChatAppState(
        enabled: enabled,
        disabled: disabled,
      );
}
