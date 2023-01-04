import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../chat_apps/domain/entity/chat_app.dart';
import '../../region/domain/entity/region.dart';
import '../domain/entity/banner.dart';

part 'home_state.freezed.dart';

@freezed
class PhoneFieldViewState with _$PhoneFieldViewState {
  const factory PhoneFieldViewState({
    required Region? selectedRegion,
    required TextEditingController controller,
    dynamic error,
  }) = _PhoneFieldViewState;
}

@freezed
class ChatAppsViewState with _$ChatAppsViewState {
  const factory ChatAppsViewState({
    required List<ChatApp> chatApps,
  }) = _ChatAppsViewState;
}

@freezed
class BannerViewState with _$BannerViewState {
  factory BannerViewState({
    required TopBannerType type,
  }) = _BannerViewState;

  factory BannerViewState.none() = _BannerViewStateNone;
}

@freezed
class AdBannerViewState with _$AdBannerViewState {
  factory AdBannerViewState({
    required String unitId,
  }) = _AdBannerViewState;

  factory AdBannerViewState.none() = _AdBannerViewStateNone;
}
