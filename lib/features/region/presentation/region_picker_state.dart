import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entity/region.dart';

part 'region_picker_state.freezed.dart';

@freezed
class RegionPickerState with _$RegionPickerState {
  factory RegionPickerState(List<Country> countries) =
      _RegionPickerStateSuccess;
  factory RegionPickerState.initial() = _RegionPickerStateInitial;
}

@freezed
class RegionPickerEvent with _$RegionPickerEvent {
  factory RegionPickerEvent.close([IRegion? region]) = _RegionPickerEventClose;
}
