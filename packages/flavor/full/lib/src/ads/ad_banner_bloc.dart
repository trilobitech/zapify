import 'package:config/config.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import 'ad_banner_state.dart';

class AdBannerBloc extends StateBloc<AdBannerState> {
  AdBannerBloc() : super(AdBannerState.none());

  @override
  Future<void> load() async {
    final unitId = await RemoteConfig.homeBannerUnitId.get<String>();
    if (unitId.isNotEmpty) {
      return setState(AdBannerState(unitId: unitId));
    }
  }
}
