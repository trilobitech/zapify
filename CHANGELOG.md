# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.0] - 2023-05-26

### Added

- Alert when can't open chat app
- Settings screen
- Setting for default region
- Setting for select chat apps

### Changed

- Shimmer on load region list

### Removed

- Check if app is installed after show buttons
- Remote call for chat app lists

## [2.0.4] - 2023-03-14

### Fixed

- Check if WhatsApp is installed

## [2.0.3] - 2023-02-06

### Fixed

- Removed permission `READ_CALL_LOG` from `call_log` package for release builds and keep only in debug

## [2.0.2] - 2023-02-03

### Removed

- READ_CALL_LOG for release builds due to Google Policy, call log is available only in dev version

## [2.0.1] - 2023-02-01

### Fixed

- Call log empty state

## [2.0.0] - 2023-02-01

### Added

- Call log tab
- Dark mode

### Changed

- Set font family to Archivo

### Fixed

- Deployment target para iOS 14
- Link to open directly WhatsApp Business

## [1.4.0] - 2022-12-24

### Added

- GitHub pages for terms and privacy police

### Changed

- Ask for app review pt-BR text
- Display country code in region picker list

## [1.3.0] - 2022-09-13

### Added

- Splash/launch screen
- Top banner asking for app review
- Handle external phone number click in Android

### Changed

- App name from Zapfy to Zapify

## [1.2.0] - 2022-07-19

### Added

- Animation on load history and app launch buttons
- AD Banner with feature flag

## [1.1.0] - 2022-07-15

### Added

- Support to WhatsApp Business and Signal

### Fixed

- App icons in launch buttons
- Talkback/VoiceOver for phone field

## [1.0.0] - 2022-07-15

- Initial Android release
- Support to WhatsApp and Telegram
- Save history
- Language support to Portuguese (Brazil) and English

[Unreleased]: https://github.com/trilobitech/zapify/compare/v2.1.0...HEAD
[2.1.0]: https://github.com/trilobitech/zapify/compare/v2.0.4...v2.1.0
[2.0.4]: https://github.com/trilobitech/zapify/compare/v2.0.3...v2.0.4
[2.0.3]: https://github.com/trilobitech/zapify/compare/v2.0.2...v2.0.3
[2.0.2]: https://github.com/trilobitech/zapify/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/trilobitech/zapify/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/trilobitech/zapify/compare/v1.4.0...v2.0.0
[1.4.0]: https://github.com/trilobitech/zapify/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/trilobitech/zapify/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/trilobitech/zapify/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/trilobitech/zapify/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/trilobitech/zapify/releases/tag/v1.0.0
