import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:zapify/common/ext/string.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);

  Locale get currentLocale => Localizations.localeOf(this);
}
