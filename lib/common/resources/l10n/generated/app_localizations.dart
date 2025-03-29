import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('pt')];

  /// No description provided for @unknowErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong!'**
  String get unknowErrorMessage;

  /// No description provided for @unknowErrorAction.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get unknowErrorAction;

  /// No description provided for @homeTopBannerAskToReviewContent.
  ///
  /// In en, this message translates to:
  /// **'Are you enjoying Zapify? Please tell us.'**
  String get homeTopBannerAskToReviewContent;

  /// No description provided for @homeTopBannerAskToReviewButton.
  ///
  /// In en, this message translates to:
  /// **'REVIEW'**
  String get homeTopBannerAskToReviewButton;

  /// No description provided for @homePhoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get homePhoneNumberLabel;

  /// No description provided for @homeOpenWithButton.
  ///
  /// In en, this message translates to:
  /// **'{appName}'**
  String homeOpenWithButton(Object appName);

  /// No description provided for @homeEmptyPhoneNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please provide the phone number'**
  String get homeEmptyPhoneNumberError;

  /// No description provided for @homeInvalidPhoneNumberError.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get homeInvalidPhoneNumberError;

  /// No description provided for @homeChatAppNotFoundErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get homeChatAppNotFoundErrorTitle;

  /// No description provided for @homeChatAppNotFoundErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while opening \"{appName}\".'**
  String homeChatAppNotFoundErrorMessage(Object appName);

  /// No description provided for @homeChatAppNotFoundErrorPrimaryAction.
  ///
  /// In en, this message translates to:
  /// **'Search in store'**
  String get homeChatAppNotFoundErrorPrimaryAction;

  /// No description provided for @homeChatAppNotFoundErrorSecondaryAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get homeChatAppNotFoundErrorSecondaryAction;

  /// No description provided for @recentNumbersTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent numbers'**
  String get recentNumbersTitle;

  /// No description provided for @recentNumbersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No recent numbers yet'**
  String get recentNumbersEmpty;

  /// No description provided for @recentNumberRemoved.
  ///
  /// In en, this message translates to:
  /// **'Recent number \"{phoneNumber}\" was removed!'**
  String recentNumberRemoved(Object phoneNumber);

  /// No description provided for @actionRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get actionRemove;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @actionSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get actionSettings;

  /// No description provided for @callLogTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone calls'**
  String get callLogTabTitle;

  /// No description provided for @callLogPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'You need to give permission to display call log.'**
  String get callLogPermissionMessage;

  /// No description provided for @callLogPermissionButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Give permission'**
  String get callLogPermissionButtonLabel;

  /// No description provided for @callLogEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No calls to display'**
  String get callLogEmptyMessage;

  /// No description provided for @availableRegionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Select a country'**
  String get availableRegionsTitle;

  /// No description provided for @availableRegionsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get availableRegionsSearch;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Default region'**
  String get settingsRegionTitle;

  /// No description provided for @settingsRegionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the default region to use when opening a number'**
  String get settingsRegionSubtitle;

  /// No description provided for @settingsMessagingAppsTitle.
  ///
  /// In en, this message translates to:
  /// **'Messaging apps'**
  String get settingsMessagingAppsTitle;

  /// No description provided for @settingsMessagingAppsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the messaging apps you want to use'**
  String get settingsMessagingAppsSubtitle;

  /// No description provided for @messagingAppsTitle.
  ///
  /// In en, this message translates to:
  /// **'Messaging apps'**
  String get messagingAppsTitle;

  /// No description provided for @messagingAppsEnabledHeader.
  ///
  /// In en, this message translates to:
  /// **'Available apps'**
  String get messagingAppsEnabledHeader;

  /// No description provided for @messagingAppsDisabledHeader.
  ///
  /// In en, this message translates to:
  /// **'Hidden apps'**
  String get messagingAppsDisabledHeader;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'\'Today at\' h:mm a'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'\'Yesterday at\' h:mm a'**
  String get yesterday;

  /// No description provided for @lastCoupleOfDays.
  ///
  /// In en, this message translates to:
  /// **'EEEE \'at\' h:mm a'**
  String get lastCoupleOfDays;

  /// No description provided for @lastCoupleOfMonths.
  ///
  /// In en, this message translates to:
  /// **'MMMM d \'at\' h:mm a'**
  String get lastCoupleOfMonths;

  /// No description provided for @longTimeAgo.
  ///
  /// In en, this message translates to:
  /// **'MMMM d, yyyy'**
  String get longTimeAgo;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
