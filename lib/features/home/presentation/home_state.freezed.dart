// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneFieldViewState {
  Region? get selectedRegion => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneFieldViewStateCopyWith<PhoneFieldViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneFieldViewStateCopyWith<$Res> {
  factory $PhoneFieldViewStateCopyWith(
          PhoneFieldViewState value, $Res Function(PhoneFieldViewState) then) =
      _$PhoneFieldViewStateCopyWithImpl<$Res, PhoneFieldViewState>;
  @useResult
  $Res call(
      {Region? selectedRegion,
      TextEditingController controller,
      dynamic error});
}

/// @nodoc
class _$PhoneFieldViewStateCopyWithImpl<$Res, $Val extends PhoneFieldViewState>
    implements $PhoneFieldViewStateCopyWith<$Res> {
  _$PhoneFieldViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRegion = freezed,
    Object? controller = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      selectedRegion: freezed == selectedRegion
          ? _value.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneFieldViewStateCopyWith<$Res>
    implements $PhoneFieldViewStateCopyWith<$Res> {
  factory _$$_PhoneFieldViewStateCopyWith(_$_PhoneFieldViewState value,
          $Res Function(_$_PhoneFieldViewState) then) =
      __$$_PhoneFieldViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Region? selectedRegion,
      TextEditingController controller,
      dynamic error});
}

/// @nodoc
class __$$_PhoneFieldViewStateCopyWithImpl<$Res>
    extends _$PhoneFieldViewStateCopyWithImpl<$Res, _$_PhoneFieldViewState>
    implements _$$_PhoneFieldViewStateCopyWith<$Res> {
  __$$_PhoneFieldViewStateCopyWithImpl(_$_PhoneFieldViewState _value,
      $Res Function(_$_PhoneFieldViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRegion = freezed,
    Object? controller = null,
    Object? error = freezed,
  }) {
    return _then(_$_PhoneFieldViewState(
      selectedRegion: freezed == selectedRegion
          ? _value.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_PhoneFieldViewState implements _PhoneFieldViewState {
  const _$_PhoneFieldViewState(
      {required this.selectedRegion, required this.controller, this.error});

  @override
  final Region? selectedRegion;
  @override
  final TextEditingController controller;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'PhoneFieldViewState(selectedRegion: $selectedRegion, controller: $controller, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneFieldViewState &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRegion, controller,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneFieldViewStateCopyWith<_$_PhoneFieldViewState> get copyWith =>
      __$$_PhoneFieldViewStateCopyWithImpl<_$_PhoneFieldViewState>(
          this, _$identity);
}

abstract class _PhoneFieldViewState implements PhoneFieldViewState {
  const factory _PhoneFieldViewState(
      {required final Region? selectedRegion,
      required final TextEditingController controller,
      final dynamic error}) = _$_PhoneFieldViewState;

  @override
  Region? get selectedRegion;
  @override
  TextEditingController get controller;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneFieldViewStateCopyWith<_$_PhoneFieldViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatAppsViewState {
  List<ChatApp> get chatApps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatAppsViewStateCopyWith<ChatAppsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatAppsViewStateCopyWith<$Res> {
  factory $ChatAppsViewStateCopyWith(
          ChatAppsViewState value, $Res Function(ChatAppsViewState) then) =
      _$ChatAppsViewStateCopyWithImpl<$Res, ChatAppsViewState>;
  @useResult
  $Res call({List<ChatApp> chatApps});
}

/// @nodoc
class _$ChatAppsViewStateCopyWithImpl<$Res, $Val extends ChatAppsViewState>
    implements $ChatAppsViewStateCopyWith<$Res> {
  _$ChatAppsViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatApps = null,
  }) {
    return _then(_value.copyWith(
      chatApps: null == chatApps
          ? _value.chatApps
          : chatApps // ignore: cast_nullable_to_non_nullable
              as List<ChatApp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatAppsViewStateCopyWith<$Res>
    implements $ChatAppsViewStateCopyWith<$Res> {
  factory _$$_ChatAppsViewStateCopyWith(_$_ChatAppsViewState value,
          $Res Function(_$_ChatAppsViewState) then) =
      __$$_ChatAppsViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatApp> chatApps});
}

/// @nodoc
class __$$_ChatAppsViewStateCopyWithImpl<$Res>
    extends _$ChatAppsViewStateCopyWithImpl<$Res, _$_ChatAppsViewState>
    implements _$$_ChatAppsViewStateCopyWith<$Res> {
  __$$_ChatAppsViewStateCopyWithImpl(
      _$_ChatAppsViewState _value, $Res Function(_$_ChatAppsViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatApps = null,
  }) {
    return _then(_$_ChatAppsViewState(
      chatApps: null == chatApps
          ? _value._chatApps
          : chatApps // ignore: cast_nullable_to_non_nullable
              as List<ChatApp>,
    ));
  }
}

/// @nodoc

class _$_ChatAppsViewState implements _ChatAppsViewState {
  const _$_ChatAppsViewState({required final List<ChatApp> chatApps})
      : _chatApps = chatApps;

  final List<ChatApp> _chatApps;
  @override
  List<ChatApp> get chatApps {
    if (_chatApps is EqualUnmodifiableListView) return _chatApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatApps);
  }

  @override
  String toString() {
    return 'ChatAppsViewState(chatApps: $chatApps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatAppsViewState &&
            const DeepCollectionEquality().equals(other._chatApps, _chatApps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chatApps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatAppsViewStateCopyWith<_$_ChatAppsViewState> get copyWith =>
      __$$_ChatAppsViewStateCopyWithImpl<_$_ChatAppsViewState>(
          this, _$identity);
}

abstract class _ChatAppsViewState implements ChatAppsViewState {
  const factory _ChatAppsViewState({required final List<ChatApp> chatApps}) =
      _$_ChatAppsViewState;

  @override
  List<ChatApp> get chatApps;
  @override
  @JsonKey(ignore: true)
  _$$_ChatAppsViewStateCopyWith<_$_ChatAppsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TopBannerType type) $default, {
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TopBannerType type)? $default, {
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TopBannerType type)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BannerViewState value) $default, {
    required TResult Function(_BannerViewStateNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BannerViewState value)? $default, {
    TResult? Function(_BannerViewStateNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BannerViewState value)? $default, {
    TResult Function(_BannerViewStateNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerViewStateCopyWith<$Res> {
  factory $BannerViewStateCopyWith(
          BannerViewState value, $Res Function(BannerViewState) then) =
      _$BannerViewStateCopyWithImpl<$Res, BannerViewState>;
}

/// @nodoc
class _$BannerViewStateCopyWithImpl<$Res, $Val extends BannerViewState>
    implements $BannerViewStateCopyWith<$Res> {
  _$BannerViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BannerViewStateCopyWith<$Res> {
  factory _$$_BannerViewStateCopyWith(
          _$_BannerViewState value, $Res Function(_$_BannerViewState) then) =
      __$$_BannerViewStateCopyWithImpl<$Res>;
  @useResult
  $Res call({TopBannerType type});
}

/// @nodoc
class __$$_BannerViewStateCopyWithImpl<$Res>
    extends _$BannerViewStateCopyWithImpl<$Res, _$_BannerViewState>
    implements _$$_BannerViewStateCopyWith<$Res> {
  __$$_BannerViewStateCopyWithImpl(
      _$_BannerViewState _value, $Res Function(_$_BannerViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_BannerViewState(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TopBannerType,
    ));
  }
}

/// @nodoc

class _$_BannerViewState implements _BannerViewState {
  _$_BannerViewState({required this.type});

  @override
  final TopBannerType type;

  @override
  String toString() {
    return 'BannerViewState(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannerViewState &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerViewStateCopyWith<_$_BannerViewState> get copyWith =>
      __$$_BannerViewStateCopyWithImpl<_$_BannerViewState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TopBannerType type) $default, {
    required TResult Function() none,
  }) {
    return $default(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TopBannerType type)? $default, {
    TResult? Function()? none,
  }) {
    return $default?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TopBannerType type)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BannerViewState value) $default, {
    required TResult Function(_BannerViewStateNone value) none,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BannerViewState value)? $default, {
    TResult? Function(_BannerViewStateNone value)? none,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BannerViewState value)? $default, {
    TResult Function(_BannerViewStateNone value)? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BannerViewState implements BannerViewState {
  factory _BannerViewState({required final TopBannerType type}) =
      _$_BannerViewState;

  TopBannerType get type;
  @JsonKey(ignore: true)
  _$$_BannerViewStateCopyWith<_$_BannerViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BannerViewStateNoneCopyWith<$Res> {
  factory _$$_BannerViewStateNoneCopyWith(_$_BannerViewStateNone value,
          $Res Function(_$_BannerViewStateNone) then) =
      __$$_BannerViewStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BannerViewStateNoneCopyWithImpl<$Res>
    extends _$BannerViewStateCopyWithImpl<$Res, _$_BannerViewStateNone>
    implements _$$_BannerViewStateNoneCopyWith<$Res> {
  __$$_BannerViewStateNoneCopyWithImpl(_$_BannerViewStateNone _value,
      $Res Function(_$_BannerViewStateNone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BannerViewStateNone implements _BannerViewStateNone {
  _$_BannerViewStateNone();

  @override
  String toString() {
    return 'BannerViewState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BannerViewStateNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TopBannerType type) $default, {
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TopBannerType type)? $default, {
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TopBannerType type)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BannerViewState value) $default, {
    required TResult Function(_BannerViewStateNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BannerViewState value)? $default, {
    TResult? Function(_BannerViewStateNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BannerViewState value)? $default, {
    TResult Function(_BannerViewStateNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _BannerViewStateNone implements BannerViewState {
  factory _BannerViewStateNone() = _$_BannerViewStateNone;
}

/// @nodoc
mixin _$AdBannerViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String unitId) $default, {
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String unitId)? $default, {
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String unitId)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdBannerViewState value) $default, {
    required TResult Function(_AdBannerViewStateNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerViewState value)? $default, {
    TResult? Function(_AdBannerViewStateNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerViewState value)? $default, {
    TResult Function(_AdBannerViewStateNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdBannerViewStateCopyWith<$Res> {
  factory $AdBannerViewStateCopyWith(
          AdBannerViewState value, $Res Function(AdBannerViewState) then) =
      _$AdBannerViewStateCopyWithImpl<$Res, AdBannerViewState>;
}

/// @nodoc
class _$AdBannerViewStateCopyWithImpl<$Res, $Val extends AdBannerViewState>
    implements $AdBannerViewStateCopyWith<$Res> {
  _$AdBannerViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AdBannerViewStateCopyWith<$Res> {
  factory _$$_AdBannerViewStateCopyWith(_$_AdBannerViewState value,
          $Res Function(_$_AdBannerViewState) then) =
      __$$_AdBannerViewStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String unitId});
}

/// @nodoc
class __$$_AdBannerViewStateCopyWithImpl<$Res>
    extends _$AdBannerViewStateCopyWithImpl<$Res, _$_AdBannerViewState>
    implements _$$_AdBannerViewStateCopyWith<$Res> {
  __$$_AdBannerViewStateCopyWithImpl(
      _$_AdBannerViewState _value, $Res Function(_$_AdBannerViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitId = null,
  }) {
    return _then(_$_AdBannerViewState(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdBannerViewState implements _AdBannerViewState {
  _$_AdBannerViewState({required this.unitId});

  @override
  final String unitId;

  @override
  String toString() {
    return 'AdBannerViewState(unitId: $unitId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdBannerViewState &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unitId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdBannerViewStateCopyWith<_$_AdBannerViewState> get copyWith =>
      __$$_AdBannerViewStateCopyWithImpl<_$_AdBannerViewState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String unitId) $default, {
    required TResult Function() none,
  }) {
    return $default(unitId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String unitId)? $default, {
    TResult? Function()? none,
  }) {
    return $default?.call(unitId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String unitId)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(unitId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdBannerViewState value) $default, {
    required TResult Function(_AdBannerViewStateNone value) none,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerViewState value)? $default, {
    TResult? Function(_AdBannerViewStateNone value)? none,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerViewState value)? $default, {
    TResult Function(_AdBannerViewStateNone value)? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AdBannerViewState implements AdBannerViewState {
  factory _AdBannerViewState({required final String unitId}) =
      _$_AdBannerViewState;

  String get unitId;
  @JsonKey(ignore: true)
  _$$_AdBannerViewStateCopyWith<_$_AdBannerViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdBannerViewStateNoneCopyWith<$Res> {
  factory _$$_AdBannerViewStateNoneCopyWith(_$_AdBannerViewStateNone value,
          $Res Function(_$_AdBannerViewStateNone) then) =
      __$$_AdBannerViewStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AdBannerViewStateNoneCopyWithImpl<$Res>
    extends _$AdBannerViewStateCopyWithImpl<$Res, _$_AdBannerViewStateNone>
    implements _$$_AdBannerViewStateNoneCopyWith<$Res> {
  __$$_AdBannerViewStateNoneCopyWithImpl(_$_AdBannerViewStateNone _value,
      $Res Function(_$_AdBannerViewStateNone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AdBannerViewStateNone implements _AdBannerViewStateNone {
  _$_AdBannerViewStateNone();

  @override
  String toString() {
    return 'AdBannerViewState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AdBannerViewStateNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String unitId) $default, {
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String unitId)? $default, {
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String unitId)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdBannerViewState value) $default, {
    required TResult Function(_AdBannerViewStateNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerViewState value)? $default, {
    TResult? Function(_AdBannerViewStateNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerViewState value)? $default, {
    TResult Function(_AdBannerViewStateNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _AdBannerViewStateNone implements AdBannerViewState {
  factory _AdBannerViewStateNone() = _$_AdBannerViewStateNone;
}
