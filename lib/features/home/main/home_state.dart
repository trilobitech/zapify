import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../region/domain/entity/region.dart';

part 'home_state.freezed.dart';

@freezed
class HomeAction with _$HomeAction implements IAction {
  factory HomeAction.navigateToRegionPicker(RegionCode? current) =
      _HomeActionNavigateToRegionPicker;
}
