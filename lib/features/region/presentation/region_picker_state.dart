import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../domain/entity/region.dart';

part 'region_picker_state.freezed.dart';

@freezed
sealed class RegionPickerState with _$RegionPickerState implements IState {
  factory RegionPickerState({@Default([]) List<Country> countries}) =
      LoadedRegionPickerState;
}

@freezed
sealed class RegionPickerAction with _$RegionPickerAction implements IAction {
  factory RegionPickerAction.close([IRegion? region]) = CloseRegionPickerAction;
}

class ShimmerCountry extends Country {
  ShimmerCountry() : super(code: '■■', name: '■■■■■■■■■■■■', prefix: 99);

  @override
  String? get flag => '🇲🇱';
}
