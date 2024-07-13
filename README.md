# Zapify

<div>
    <a href='https://play.google.com/store/apps/details?id=com.zapfy.app&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' style="height: 50px" align="center"/></a> <!-- <a href="[store-link]?itsct=apps_box_badge&amp;itscg=30200"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en?size=250x83&amp;releaseDate=1627171200?h=cffe6c4b48ab6dc75dbc0f04b34de8c2" alt="Download on the App Store" style="height: 39px" align="center"></a> -->
</div>

There are many of others applications for the same purpose, but this app is just a "laboratory" to study about Flutter/Dart, try new things and share with anyone who may be interested and mainly because I believe that all software should be open source.

## Features

- Open some popular chat applications that uses phone number, avoiding the need to save contact;
- Use phone call log helps to contact someone that call to you;
- Handle `tel:` protocol click to give more options to contact someone.

<!-- TODO: add some screenshots -->

## Building from source

### Requirements

- Flutter ^3.22.2 or [FVM](https://fvm.app/) (recommended)
- Platform SDKs: Android and XCode
- Registered Android and iOS projects in Firebase

### Setup

```bash
# Get dependencies
fvm flutter pub get

# Download Firebase configuration
fvm dart run flutter_toolkit:cli project-setup
```

### Run

```bash
fvm dart run flutter_toolkit:cli run-app
```

### Unit tests

```bash
fvm flutter test
```

## Built with

Some important dependencies to highlight:

- [url_launcher](https://pub.dev/packages/url_launcher): check and launch applications via deeplink;
- [phone_number](https://pub.dev/packages/phone_number): provide countries, validate, parse and format phone numbers;
- [get_it](https://pub.dev/packages/get_it): dart dependency injection;
- [sqlbrite](https://pub.dev/packages/sqlbrite): reactive local storage built on top of [sqflite](https://pub.dev/packages/sqflite);
- [receive_intent](https://pub.dev/packages/receive_intent): to retrieve phone number when clicked on link with `tel:` protocol;
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): used in a particular way to help with presentation layer design handling states and events;
- [flutter_toolkit](https://github.com/pedrox-hs/flutter_packages/tree/main/flutter_toolkit): my personal package to help with some common commands to configure and run application.
