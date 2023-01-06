import 'package:app_install_date/app_install_date.dart';

import '../../../../../../common/ext/future.dart';
import '../../../../../../config/local_config.dart';
import '../../../../../../config/remote_config.dart';

class CanAskForReviewUseCase {
  Future<bool> call() async {
    final bool isRequestReviewEnabled =
        await RemoteConfig.isRequestReviewEnabled.get();

    if (!isRequestReviewEnabled) {
      return false;
    }

    final nextReviewAt = await LocalConfig.lastAppReviewAt
        .get<int?>()
        .thenIfNotNull(DateTime.fromMillisecondsSinceEpoch)
        .orDefault(() => AppInstallDate().installDate)
        .then((date) => date.add(const Duration(days: 31)));

    return DateTime.now().isAfter(nextReviewAt);
  }
}

class SetLastAppReviewAtNowUseCase {
  Future<void> call() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await LocalConfig.lastAppReviewAt.set(now);
  }
}
