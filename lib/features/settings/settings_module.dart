import '../../common/di/definition.dart';
import 'presentation/settings_bloc.dart';

void settingsModule() {
  registerFactory(
    () => SettingsBloc(getDefaultRegion: get(), setDefaultRegion: get()),
  );
}
