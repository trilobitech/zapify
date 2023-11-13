import 'package:analytics_core/analytics_core.dart';
import 'package:config/config.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../logger.dart';
import '../domain/entity/top_banner.dart';
import '../domain/usecase/app_review.dart';
import '../domain/usecase/get_top_banner.dart';
import 'top_banner_state.dart';

class TopBannerBloc extends StateBloc<TopBannerState> {
  TopBannerBloc({
    required GetTopBannerUseCase getTopBanner,
    required SetLastAppReviewAtNowUseCase setLastAppReviewAtNow,
    required IAnalytics analytics,
    required InAppReview inAppReview,
  })  : _getTopBanner = getTopBanner,
        _setLastAppReviewAtNow = setLastAppReviewAtNow,
        _analytics = analytics,
        _inAppReview = inAppReview,
        super(TopBannerState.none());

  final GetTopBannerUseCase _getTopBanner;
  final SetLastAppReviewAtNowUseCase _setLastAppReviewAtNow;
  final IAnalytics _analytics;
  final InAppReview _inAppReview;

  @override
  Future<void> load() async {
    setStateFrom(
      _getTopBanner().map(_mapToState),
    );
  }

  void onTopBannerActionTap(TopBannerType type) {
    _analytics.buttonPressed('$type');
    switch (type) {
      case TopBannerType.appReview:
        _requestAppReview();
        break;
    }
  }

  void _requestAppReview() async {
    await _inAppReview
        .isAvailable()
        .then((isInAppReviewAvailable) {
          if (isInAppReviewAvailable) {
            return _inAppReview.requestReview();
          }
          logger.severe('InAppReview not available');
          return _inAppReview.openStoreListing(
            appStoreId: EnvConfig.appStoreId,
          );
        })
        .catchError(
          (e, stack) => logger.severe('Error requesting app review', e, stack),
        )
        .then((_) => _setLastAppReviewAtNow());
  }

  TopBannerState _mapToState(TopBannerType type) {
    _analytics.logEvent(
      'top_banner_viewed',
      properties: {'banner_type': type.name},
    );
    return TopBannerState(type: type);
  }
}
