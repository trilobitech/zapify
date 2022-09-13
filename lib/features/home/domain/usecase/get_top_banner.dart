import 'package:zapify/features/home/domain/entity/banner.dart';
import 'package:zapify/features/home/domain/usecase/app_review.dart';
import 'package:zapify/features/home/presentation/home_state.dart';

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
