import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../region/domain/entity/region.dart';

part 'phone_field_state.freezed.dart';

class PhoneFieldState {
  PhoneFieldState(this.ctrl, this.region, [this.error]);

  factory PhoneFieldState.initial() => PhoneFieldState(
        TextEditingController(),
        Region.br(),
      );

  PhoneFieldState copyWith({
    TextEditingController? ctrl,
    Region? region,
    Object? error,
  }) =>
      PhoneFieldState(ctrl ?? this.ctrl, region ?? this.region, error);

  final TextEditingController ctrl;
  final Region region;
  final Object? error;
}

@freezed
class PhoneFieldEvent with _$PhoneFieldEvent {
  factory PhoneFieldEvent.hideKeyboard() = _PhoneFieldEventHideKeyboard;
  factory PhoneFieldEvent.showKeyboard() = _PhoneFieldEventShowKeyboard;
}
