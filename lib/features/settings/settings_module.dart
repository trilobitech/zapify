import 'package:di_core/di_core.dart';

import 'presentation/settings_bloc.dart';

void settingsModule() {
  registerFactory(
    () => SettingsBloc(
      getDefaultRegion: get(),
      setDefaultRegion: get(),
    ),
  );
}
