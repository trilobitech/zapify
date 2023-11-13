library resources;

import 'package:di_core/di_core.dart';

import 'localizations.dart';

void l10nModule() {
  registerFactory<AppLocalizations>(
    () => AppLocalizations.of(navigatorKey.currentContext!),
  );
}
