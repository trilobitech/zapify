import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExt on AppLocalizations {
  String formatDate(DateTime dt) =>
      DateFormat(_formatFrom(dt), localeName).format(dt);

  String _formatFrom(DateTime dt) {
    DateTime now = DateTime.now();
    if (dt.day == now.day && dt.month == now.month && dt.year == now.year) {
      return today;
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (dt.day == yesterday.day &&
        dt.month == yesterday.month &&
        dt.year == yesterday.year) {
      return this.yesterday;
    }

    if (now.difference(dt).inDays < 4) {
      return lastCoupleOfDays;
    }

    const elevenMonthsInDays = 11 * 30;
    if (now.difference(dt).inDays < elevenMonthsInDays) {
      return lastCoupleOfMonths;
    }

    return longTimeAgo;
  }
}
