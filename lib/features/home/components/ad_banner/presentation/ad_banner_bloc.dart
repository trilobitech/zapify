import '../../../../../common/arch/bloc_controller.dart';
import '../../../../../config/remote_config.dart';
import 'ad_banner_state.dart';

class AdBannerBloc extends BlocController<AdBannerState, NoAction> {
  AdBannerBloc() : super(AdBannerState.none());

  @override
  Future<void> load() async {
    final String unitId = await RemoteConfig.homeBannerUnitId.get();
    if (unitId.isNotEmpty) {
      return setState(AdBannerState(unitId: unitId));
    }
  }
}
