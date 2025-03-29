import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

part 'ad_banner_state.freezed.dart';

@freezed
class AdBannerState with _$AdBannerState implements IState {
  factory AdBannerState({required String unitId}) = _AdBannerState;

  factory AdBannerState.none() = _AdBannerStateNone;
}
