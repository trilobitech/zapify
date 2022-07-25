import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zapify/core/error_handler/failure.dart';

class EmptyPhoneNumberFailure extends Failure {
  @override
  String message(AppLocalizations localizations) =>
      localizations.homeEmptyPhoneNumberError;
}

class InvalidPhoneNumberFailure extends Failure {
  @override
  String message(AppLocalizations localizations) =>
      localizations.homeInvalidPhoneNumberError;
}
