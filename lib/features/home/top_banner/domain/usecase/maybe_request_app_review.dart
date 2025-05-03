import 'package:in_app_review/in_app_review.dart';
import 'package:logify/logify.dart';

import 'app_review.dart';

class MaybeRequestAppReviewUseCase {
  MaybeRequestAppReviewUseCase({
    required CanAskForReviewUseCase canAskForReview,
    required SetLastAppReviewAtNowUseCase setLastAppReviewAtNow,
  }) : _canAskForReview = canAskForReview,
       _setLastAppReviewAtNow = setLastAppReviewAtNow;

  final CanAskForReviewUseCase _canAskForReview;
  final SetLastAppReviewAtNowUseCase _setLastAppReviewAtNow;

  Future<bool> call() async {
    try {
      if (!await _canAskForReview()) return false;

      final inAppReview = InAppReview.instance;
      final isInAppReviewAvailable = await inAppReview.isAvailable();

      if (!isInAppReviewAvailable) {
        throw Exception('InAppReview not available');
      }

      await inAppReview.requestReview();
      return true;
    } catch (e, stackTrace) {
      Log.e('Error requesting app review: $e', e, stackTrace);
      return false;
    } finally {
      _setLastAppReviewAtNow();
    }
  }
}
