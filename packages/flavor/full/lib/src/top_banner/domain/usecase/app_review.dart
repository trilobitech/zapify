import 'package:app_install_date/app_install_date.dart';
import 'package:config/config.dart';
import 'package:ext/future.dart';

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
        .then((date) => date.add(const Duration(days: 31)));

    return DateTime.now().isAfter(nextReviewAt);
  }
}

class SetLastAppReviewAtNowUseCase {
  void call() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await LocalConfig.lastAppReviewAt.set(now);
  }
}
