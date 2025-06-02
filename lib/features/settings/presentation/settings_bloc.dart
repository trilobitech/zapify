import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../routes.dart';
import '../../region/domain/entity/region.dart';
import '../../region/domain/usecase/get_default_region.dart';
import '../../region/domain/usecase/set_detault_region.dart';
import 'settings_action.dart';

export 'settings_action.dart';

class SettingsBloc extends ActionBloc<SettingsAction> {
  SettingsBloc({
    required GetDefaultRegionUseCase getDefaultRegion,
    required SetDefaultRegionUseCase setDefaultRegion,
  }) : _getDefaultRegion = getDefaultRegion,
       _setDefaultRegion = setDefaultRegion,
       super();

  final GetDefaultRegionUseCase _getDefaultRegion;
  final SetDefaultRegionUseCase _setDefaultRegion;

  void onDefaultRegionOptionClicked() async {
    final defaultRegion = await _getDefaultRegion();
    sendAction(
      SettingsAction.navigateTo(
        RoutePaths.regions,
        args: {'selected_code': defaultRegion.code},
      ),
    );
  }

  void onMessagingAppsOptionClicked() {
    sendAction(SettingsAction.navigateTo(RoutePaths.messagingAppsSettings));
  }

  Future onOptionUpdated(String route, dynamic result) async {
    if (route == RoutePaths.regions && result is IRegion) {
      return _setDefaultRegion(result);
    }
  }
}
