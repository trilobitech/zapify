import '../../../../common/di/definition.dart';
import 'presentation/chat_apps_bloc.dart';

void chatAppsModule() {
  registerFactory(
    () => ChatAppsBloc(getEnabledChatApps: get(), analytics: get()),
  );
}
