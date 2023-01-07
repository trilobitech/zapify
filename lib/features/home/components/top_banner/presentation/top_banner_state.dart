import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/arch/bloc_state.dart';
import '../domain/entity/top_banner.dart';

part 'top_banner_state.freezed.dart';

@freezed
class TopBannerState with _$TopBannerState implements IState {
  factory TopBannerState({
    required TopBannerType type,
  }) = _TopBannerState;

  factory TopBannerState.none() = _TopBannerStateNone;
}
