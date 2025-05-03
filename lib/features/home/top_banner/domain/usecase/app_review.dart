import 'package:app_install_date/app_install_date.dart';
import 'package:logify/logify.dart';

import '../../../../../../common/config/local_config.dart';
import '../../../../../../common/config/remote_config.dart';
import '../../../../../../common/ext/future.dart';

class CanAskForReviewUseCase {
  Future<bool> call() async {
    final isRequestReviewEnabled =
        await RemoteConfig.isRequestReviewEnabled.get<bool>();

    if (!isRequestReviewEnabled) {
      return false;
    }

    final nextReviewAt = await LocalConfig.lastAppReviewAt
        .get<int?>()
        .thenIfNotNull(DateTime.fromMillisecondsSinceEpoch)
        .orDefault(() => AppInstallDate().installDate)
        .then(
          (date) async => date.add(
            Duration(
              days: await RemoteConfig.askForReviewDaysInterval.get<int>(),
            ),
          ),
        );

    return DateTime.now().isAfter(nextReviewAt);
  }
}

class SetLastAppReviewAtNowUseCase {
  void call() async {
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      await LocalConfig.lastAppReviewAt.set(now);
    } catch (e, stackTrace) {
      Log.e(e, stackTrace);
    }
  }
}
