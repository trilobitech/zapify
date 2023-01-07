import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/arch/bloc_state.dart';

part 'ad_banner_state.freezed.dart';

@freezed
class AdBannerState with _$AdBannerState implements IState {
  factory AdBannerState({
    required String unitId,
  }) = _AdBannerState;

  factory AdBannerState.none() = _AdBannerStateNone;
}
