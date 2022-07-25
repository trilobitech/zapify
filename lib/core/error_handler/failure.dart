import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class Failure implements Exception {
  String message(AppLocalizations localizations);
}
