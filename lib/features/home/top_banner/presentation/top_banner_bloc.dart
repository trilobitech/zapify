import 'package:analytics/analytics.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/top_banner.dart';
import '../domain/usecase/get_top_banner.dart';
import 'top_banner_state.dart';

class TopBannerBloc extends StateBloc<TopBannerState> {
  TopBannerBloc({
    required GetTopBannerUseCase getTopBanner,
    required IAnalytics analytics,
  }) : _getTopBanner = getTopBanner,
       _analytics = analytics,
       super(TopBannerState.none());

  final GetTopBannerUseCase _getTopBanner;
  final IAnalytics _analytics;

  @override
  Future<void> load() async {
    setStateFrom(_getTopBanner().map(_mapToState));
  }

  void onTopBannerActionTap(TopBannerType type) {
    _analytics.buttonPressed('$type');
    switch (type) {
      case TopBannerType.updateAvailable:
        // TODO: Implement update available action
        break;
    }
  }

  TopBannerState _mapToState(TopBannerType type) {
    _analytics.logEvent(
      'top_banner_viewed',
      properties: {'banner_type': type.name},
    );
    return TopBannerState(type: type);
  }
}
