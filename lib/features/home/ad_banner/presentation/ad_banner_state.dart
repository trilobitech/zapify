import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

part 'ad_banner_state.freezed.dart';

@freezed
sealed class AdBannerState with _$AdBannerState implements IState {
  factory AdBannerState({required String unitId}) = LoadedAdBannerState;

  factory AdBannerState.none() = NoneAdBannerState;
}
