import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../../../common/config/remote_config.dart';
import 'ad_banner_state.dart';

class AdBannerBloc extends StateBloc<AdBannerState> {
  AdBannerBloc() : super(AdBannerState.none());

  @override
  Future<void> load() async {
    final String unitId = await RemoteConfig.homeBannerUnitId.get();
    if (unitId.isNotEmpty) {
      return setState(AdBannerState(unitId: unitId));
    }
  }
}