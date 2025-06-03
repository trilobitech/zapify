import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../region/domain/entity/region.dart';

part 'phone_field_state.freezed.dart';

class PhoneFieldState extends Equatable implements IState {
  const PhoneFieldState(this.controller, [this.region, this.error]);

  factory PhoneFieldState.initial() => PhoneFieldState(TextEditingController());

  PhoneFieldState copyWith({
    TextEditingController? controller,
    IRegion? region,
    Object? error,
  }) => PhoneFieldState(
    controller ?? this.controller,
    region ?? this.region,
    error,
  );

  final TextEditingController controller;
  final IRegion? region;
  final Object? error;

  @override
  List<Object?> get props => [controller, region?.code, error];
}

@freezed
sealed class PhoneFieldAction with _$PhoneFieldAction implements IAction {
  factory PhoneFieldAction.hideKeyboard() = HideKeyboardPhoneFieldAction;

  factory PhoneFieldAction.showKeyboard() = ShowKeyboardPhoneFieldAction;

  factory PhoneFieldAction.showFillPhoneNumberFailure() =
      ShowFillPhoneNumberFailurePhoneFieldAction;
}
