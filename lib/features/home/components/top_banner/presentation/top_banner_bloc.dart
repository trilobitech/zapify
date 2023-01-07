import 'package:in_app_review/in_app_review.dart';
import 'package:logger_plus/logger_plus.dart';

import '../../../../../common/arch/bloc_controller.dart';
import '../../../../../config/env_config.dart';
import '../domain/entity/top_banner.dart';
import '../domain/usecase/app_review.dart';
import '../domain/usecase/get_top_banner.dart';
import 'top_banner_state.dart';

class TopBannerBloc extends BlocController<TopBannerState, NoAction> {
  TopBannerBloc({
    required GetTopBannerUseCase getTopBanner,
    required SetLastAppReviewAtNowUseCase setLastAppReviewAtNow,
  })  : _getTopBanner = getTopBanner,
        _setLastAppReviewAtNow = setLastAppReviewAtNow,
        super(TopBannerState.none());

  final GetTopBannerUseCase _getTopBanner;
  final SetLastAppReviewAtNowUseCase _setLastAppReviewAtNow;

  @override
  Future<void> load() async {
    subscriptions.add(
      _getTopBanner().map(_mapToState).listen(setState),
    );
  }

  void onTopBannerActionTap(TopBannerType type) {
    switch (type) {
      case TopBannerType.appReview:
        askForReview();
        break;
    }
  }

  Future<void> askForReview() async {
    final inAppReview = InAppReview.instance;

    await inAppReview
        .isAvailable()
        .then((isAvailable) async {
          if (!isAvailable) {
            throw 'InAppReview not available';
          }
        })
        .then((value) => inAppReview.requestReview())
        .catchError((error, stack) {
          Log.e(error, stack);
          return inAppReview.openStoreListing(appStoreId: EnvConfig.appStoreId);
        })
        .then((_) => _setLastAppReviewAtNow());
  }

  TopBannerState _mapToState(TopBannerType type) => TopBannerState(type: type);
}
