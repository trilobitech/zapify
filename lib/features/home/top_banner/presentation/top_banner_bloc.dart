import 'package:analytics/analytics.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../../../common/config/env_config.dart';
import '../domain/entity/top_banner.dart';
import '../domain/usecase/app_review.dart';
import '../domain/usecase/get_top_banner.dart';
import 'top_banner_state.dart';

class TopBannerBloc extends StateBloc<TopBannerState> {
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
    setStateFrom(
      _getTopBanner().map(_mapToState),
    );
  }

  void onTopBannerActionTap(TopBannerType type) {
    analytics.buttonPressed('$type');
    switch (type) {
      case TopBannerType.appReview:
        _requestAppReview();
        break;
    }
  }

  void _requestAppReview() async {
    final inAppReview = InAppReview.instance;

    await inAppReview
        .isAvailable()
        .then((isInAppReviewAvailable) {
          if (isInAppReviewAvailable) {
            return inAppReview.requestReview();
          }
          Log.e('InAppReview not available');
          return inAppReview.openStoreListing(appStoreId: EnvConfig.appStoreId);
        })
        .catchError(catchErrorLogger)
        .then((_) => _setLastAppReviewAtNow());
  }

  TopBannerState _mapToState(TopBannerType type) {
    analytics.logEvent(
      'top_banner_viewed',
      properties: {'banner_type': type.name},
    );
    return TopBannerState(type: type);
  }
}
