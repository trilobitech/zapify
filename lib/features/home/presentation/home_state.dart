import 'package:freezed_annotation/freezed_annotation.dart';

import '../../region/domain/entity/region.dart';
import '../domain/entity/banner.dart';

part 'home_state.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  factory HomeEvent.navigateToRegionPicker(Region current) =
      _HomeEventNavigateToRegionPicker;
}

@freezed
class BannerViewState with _$BannerViewState {
  factory BannerViewState({
    required TopBannerType type,
  }) = _BannerViewState;

  factory BannerViewState.none() = _BannerViewStateNone;
}
