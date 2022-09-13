import 'package:app_install_date/app_install_date.dart';
import 'package:zapify/config/local_config.dart';
import 'package:zapify/core/ext/future.dart';

class CanAskForReview {
  Future<bool> call() async {
    final nextReviewAt = await LocalConfig.lastAppReviewAt
        .get<int?>()
        .thenIfNotNull(DateTime.fromMillisecondsSinceEpoch)
        .orDefault(() => AppInstallDate().installDate)
        .then((date) => date.add(const Duration(days: 31)));

    return DateTime.now().isAfter(nextReviewAt);
  }
}

class SetLastAppReviewAtNow {
  Future<void> call() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await LocalConfig.lastAppReviewAt.set(now);
  }
}
