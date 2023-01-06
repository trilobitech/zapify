import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../region/domain/entity/region.dart';

part 'phone_field_state.freezed.dart';

class PhoneFieldState {
  PhoneFieldState(this.controller, [this.region, this.error]);

  factory PhoneFieldState.initial() => PhoneFieldState(TextEditingController());

  PhoneFieldState copyWith({
    TextEditingController? controller,
    IRegion? region,
    Object? error,
  }) =>
      PhoneFieldState(
        controller ?? this.controller,
        region ?? this.region,
        error,
      );

  final TextEditingController controller;
  final IRegion? region;
  final Object? error;
}

@freezed
class PhoneFieldEvent with _$PhoneFieldEvent {
  factory PhoneFieldEvent.hideKeyboard() = _PhoneFieldEventHideKeyboard;
  factory PhoneFieldEvent.showKeyboard() = _PhoneFieldEventShowKeyboard;
}
