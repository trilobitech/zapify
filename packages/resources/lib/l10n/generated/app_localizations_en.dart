// ignore_for_file: unnecessary_string_escapes

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get unknowErrorMessage => 'Oops! Something went wrong!';

  @override
  String get unknowErrorAction => 'Try again';

  @override
  String get homeTopBannerAskToReviewContent =>
      'Are you enjoying Zapify? Please tell us.';

  @override
  String get homeTopBannerAskToReviewButton => 'REVIEW';

  @override
  String get homePhoneNumberLabel => 'Phone number';

  @override
  String homeOpenWithButton(Object appName) {
    return '$appName';
  }

  @override
  String get homeEmptyPhoneNumberError => 'Please provide the phone number';

  @override
  String get homeInvalidPhoneNumberError => 'Invalid phone number';

  @override
  String get homeChatAppNotFoundErrorTitle => 'Oops!';

  @override
  String homeChatAppNotFoundErrorMessage(Object appName) {
    return 'Something went wrong while opening \"$appName\".';
  }

  @override
  String get homeChatAppNotFoundErrorPrimaryAction => 'Search in store';

  @override
  String get homeChatAppNotFoundErrorSecondaryAction => 'Cancel';

  @override
  String get recentNumbersTitle => 'Recent numbers';

  @override
  String get recentNumbersEmpty => 'No recent numbers yet';

  @override
  String recentNumberRemoved(Object phoneNumber) {
    return 'Recent number \"$phoneNumber\" was removed!';
  }

  @override
  String get actionRemove => 'Remove';

  @override
  String get actionUndo => 'Undo';

  @override
  String get actionSettings => 'Settings';

  @override
  String get callLogTabTitle => 'Phone calls';

  @override
  String get callLogPermissionMessage =>
      'You need to give permission to display call log.';

  @override
  String get callLogPermissionButtonLabel => 'Give permission';

  @override
  String get callLogEmptyMessage => 'No calls to display';

  @override
  String get availableRegionsTitle => 'Select a country';

  @override
  String get availableRegionsSearch => 'Search…';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsRegionTitle => 'Default region';

  @override
  String get settingsRegionSubtitle =>
      'Select the default region to use when opening a number';

  @override
  String get settingsMessagingAppsTitle => 'Messaging apps';

  @override
  String get settingsMessagingAppsSubtitle =>
      'Select the messaging apps you want to use';

  @override
  String get messagingAppsTitle => 'Messaging apps';

  @override
  String get messagingAppsEnabledHeader => 'Available apps';

  @override
  String get messagingAppsDisabledHeader => 'Hidden apps';

  @override
  String get today => '\'Today at\' h:mm a';

  @override
  String get yesterday => '\'Yesterday at\' h:mm a';

  @override
  String get lastCoupleOfDays => 'EEEE \'at\' h:mm a';

  @override
  String get lastCoupleOfMonths => 'MMMM d \'at\' h:mm a';

  @override
  String get longTimeAgo => 'MMMM d, yyyy';
}
