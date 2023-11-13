import 'package:di_core/di_core.dart';

import 'presentation/chat_apps_bloc.dart';

void chatAppsModule() {
  registerFactory(
    () => ChatAppsBloc(
      getEnabledChatApps: get(),
      analytics: get(),
    ),
  );
}
