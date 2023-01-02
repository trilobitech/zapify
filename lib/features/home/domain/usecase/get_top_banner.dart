import '../../presentation/home_state.dart';
import '../entity/banner.dart';
import 'app_review.dart';

class GetTopBannerUseCase {
  GetTopBannerUseCase({
    required this.canAskForReview,
  });

  CanAskForReview canAskForReview;

  Stream<BannerViewState> call() async* {
    if (await canAskForReview()) {
      yield BannerViewState(type: TopBannerType.appReview);
    }
  }
}
