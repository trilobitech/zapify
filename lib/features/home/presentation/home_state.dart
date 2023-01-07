import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/arch/bloc_state.dart';
import '../../region/domain/entity/region.dart';

part 'home_state.freezed.dart';

@freezed
class HomeAction with _$HomeAction implements IAction {
  factory HomeAction.navigateToRegionPicker(RegionCode? current) =
      _HomeActionNavigateToRegionPicker;
}
