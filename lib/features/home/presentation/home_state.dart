import 'package:freezed_annotation/freezed_annotation.dart';

import '../../region/domain/entity/region.dart';

part 'home_state.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  factory HomeEvent.navigateToRegionPicker(RegionCode? current) =
      _HomeEventNavigateToRegionPicker;
}
