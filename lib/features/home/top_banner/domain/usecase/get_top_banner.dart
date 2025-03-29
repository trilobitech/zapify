import '../../../top_banner/domain/entity/top_banner.dart';
import 'app_review.dart';

class GetTopBannerUseCase {
  GetTopBannerUseCase({required this.canAskForReview});

  CanAskForReviewUseCase canAskForReview;

  Stream<TopBannerType> call() async* {
    if (await canAskForReview()) {
      yield TopBannerType.appReview;
    }
  }
}
