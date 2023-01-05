import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'domain/usecase/app_review.dart';
import 'domain/usecase/get_top_banner.dart';
import 'presentation/top_banner_bloc.dart';

void topBannerModule() {
  registerFactory(
    () => TopBannerBloc(
      getTopBanner: get(),
      setLastAppReviewAtNow: get(),
    ),
  );

  registerFactory(
    () => GetTopBannerUseCase(
      canAskForReview: get(),
    ),
  );

  registerFactory(
    () => CanAskForReviewUseCase(),
  );

  registerFactory(
    () => SetLastAppReviewAtNowUseCase(),
  );
}
