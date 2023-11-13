import 'package:banner_core/banner_core.dart';
import 'package:di_core/di_core.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:zapify_flavor/src/top_banner/presentation/top_banner_widget.dart';

import 'domain/usecase/app_review.dart';
import 'domain/usecase/get_top_banner.dart';
import 'presentation/top_banner_bloc.dart';

void topBannerModule() {
  registerFactory<TopBannerWidget>(
    () => TopBannerWidgetImpl(),
  );

  registerFactory(
    () => TopBannerBloc(
      getTopBanner: GetTopBannerUseCase(
        canAskForReview: CanAskForReviewUseCase(),
      ),
      setLastAppReviewAtNow: SetLastAppReviewAtNowUseCase(),
      analytics: get(),
      inAppReview: InAppReview.instance,
    ),
  );
}
