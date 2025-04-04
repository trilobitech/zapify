# Zapify

<div>
    <a href='https://play.google.com/store/apps/details?id=com.zapfy.app&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'>
        <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' style="height: 50px" align="center"/>
    </a>
    <!-- <a href="[store-link]?itsct=apps_box_badge&amp;itscg=30200">
        <img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en?size=250x83&amp;releaseDate=1627171200?h=cffe6c4b48ab6dc75dbc0f04b34de8c2" alt="Download on the App Store" style="height: 39px" align="center">
    </a> -->
</div>

Zapify is a lightweight app that helps you quickly open chat applications using just a phone number — no need to save contacts!

There are many apps with similar purposes, but this one is just a "lab" to experiment with Flutter/Dart, try out new ideas, share knowledge, and — most importantly — because I believe all software should be open source.

## Features

- Open popular chat apps that support phone numbers, without saving them as contacts;
- Use your phone call log to help you reach people you've recently talked to (available only when the app is installed from source);
- Handle `tel:` links by offering multiple messaging options when tapping on a phone number.

<!-- TODO: Add screenshots -->

## Building from Source

### Requirements

- Flutter ^3.29.2
- Platform SDKs: Android and/or Xcode
- Firebase project with registered Android/iOS apps
- Firebase CLI installed and authenticated

### Setup

```bash
# Clone the repository
git clone https://github.com/trilobitech/zapify.git zapify-app

# Go to the project directory
cd zapify-app

# Get dependencies
flutter pub get

# Install flutterfire_cli
dart pub global activate flutterfire_cli

# Download Firebase configuration
flutterfire configure -y \
    --project=REPLACE_WITH_YOUR_PROJECT_ID \
    --out=lib/firebase_options.dart \
    --platforms=android,ios \
    --android-package-name=com.zapfy.app \
    --ios-bundle-id=com.zapfy.app
```

### Run

```bash
make run
```

### Run Tests

```bash
flutter test
```

## Built With

Some key dependencies used in this project:

- [url_launcher](https://pub.dev/packages/url_launcher): check and launch apps via deeplinks;
- [phone_number](https://pub.dev/packages/phone_number): parse, format, validate phone numbers and provide country metadata;
- [get_it](https://pub.dev/packages/get_it): lightweight dependency injection;
- [sqlbrite](https://pub.dev/packages/sqlbrite): reactive SQLite wrapper based on [sqflite](https://pub.dev/packages/sqflite);
- [receive_intent](https://pub.dev/packages/receive_intent): receive incoming `tel:` intents;
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): handles presentation layer using state management via events and states.
