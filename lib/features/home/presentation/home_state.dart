import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

part 'home_state.freezed.dart';

@freezed
class PhoneFieldViewState with _$PhoneFieldViewState {
  const factory PhoneFieldViewState({
    required Region? selectedRegion,
    required TextEditingController controller,
  }) = _PhoneFieldViewState;
}

@freezed
class ChatAppsViewState with _$ChatAppsViewState {
  const factory ChatAppsViewState({
    required List<ChatApp> chatApps,
  }) = _ChatAppsViewState;
}
