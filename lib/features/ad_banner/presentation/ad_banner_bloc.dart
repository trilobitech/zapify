import '../../../config/remote_config.dart';
import '../../../core/arch/bloc_controller.dart';
import 'ad_banner_state.dart';

class AdBannerBloc extends BlocController<void, AdBannerState> {
  AdBannerBloc() : super(AdBannerState.none());

  @override
  Future<void> load() async {
    final String unitId = await RemoteConfig.homeBannerUnitId.get();
    if (unitId.isNotEmpty) {
      return emit(AdBannerState(unitId: unitId));
    }
  }
}
