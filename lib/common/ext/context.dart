import 'dart:io';

import 'package:flutter/widgets.dart';

import '../resources/localizations.dart';

export 'package:provider/provider.dart' show ReadContext;

export '../resources/localizations.dart';
export 'string.dart';

extension StringsContext on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);
}

extension AppLocalizationsX on AppLocalizations {
  String get appStoreName {
    if (Platform.isMacOS || Platform.isIOS) return appleStoreName;
    if (Platform.isAndroid) return googlePlayStoreName;
    return genericStoreName;
  }
}
