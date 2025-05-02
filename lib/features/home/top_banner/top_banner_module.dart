import '../../../../common/di/definition.dart';
import 'domain/usecase/app_review.dart';
import 'domain/usecase/get_top_banner.dart';
import 'domain/usecase/maybe_request_app_review.dart';
import 'presentation/top_banner_bloc.dart';

void topBannerModule() {
  registerFactory(() => TopBannerBloc(getTopBanner: get(), analytics: get()));

  registerFactory(() => GetTopBannerUseCase(canAskForReview: get()));

  registerFactory(() => CanAskForReviewUseCase());

  registerFactory(
    () => MaybeRequestAppReviewUseCase(
      setLastAppReviewAtNow: get(),
      canAskForReview: get(),
    ),
  );

  registerFactory(() => SetLastAppReviewAtNowUseCase());
}
