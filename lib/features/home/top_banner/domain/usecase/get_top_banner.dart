import '../../../top_banner/domain/entity/top_banner.dart';
import 'app_review.dart';

class GetTopBannerUseCase {
  GetTopBannerUseCase({required this.canAskForReview});

  final CanAskForReviewUseCase canAskForReview;

  Stream<TopBannerType> call() async* {
    // TODO: Implement logic to determine the top banner type
  }
}
