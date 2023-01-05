import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_banner_state.freezed.dart';

@freezed
class AdBannerState with _$AdBannerState {
  factory AdBannerState({
    required String unitId,
  }) = _AdBannerState;

  factory AdBannerState.none() = _AdBannerStateNone;
}
