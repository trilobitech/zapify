import 'package:in_app_review/in_app_review.dart';
import 'package:logger_plus/logger_plus.dart';

import '../../../config/env_config.dart';
import '../../../config/remote_config.dart';
import '../domain/entity/banner.dart';
import '../domain/usecase/app_review.dart';
import '../domain/usecase/get_top_banner.dart';
import 'home_state.dart';

class HomeController with _BannerController, _AdBannerController {
  HomeController({
    required this.getTopBanner,
    required this.setLastAppReviewAtNow,
  });

  @override
  final GetTopBannerUseCase getTopBanner;

  @override
  final SetLastAppReviewAtNow setLastAppReviewAtNow;
}

mixin _BannerController {
  GetTopBannerUseCase get getTopBanner;
  SetLastAppReviewAtNow get setLastAppReviewAtNow;

  Stream<BannerViewState> get bannerViewState => getTopBanner();

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
        .then((_) => setLastAppReviewAtNow());
  }
}

mixin _AdBannerController {
  Future<AdBannerViewState> get adBannerState async {
    final String unitId = await RemoteConfig.homeBannerUnitId.get();

    if (unitId.isEmpty) {
      return AdBannerViewState.none();
    }

    return AdBannerViewState(unitId: unitId);
  }
}
