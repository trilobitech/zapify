// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegionPickerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Country> countries) $default, {
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Country> countries)? $default, {
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Country> countries)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value) $default, {
    required TResult Function(_RegionPickerStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegionPickerStateSuccess value)? $default, {
    TResult? Function(_RegionPickerStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value)? $default, {
    TResult Function(_RegionPickerStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionPickerStateCopyWith<$Res> {
  factory $RegionPickerStateCopyWith(
          RegionPickerState value, $Res Function(RegionPickerState) then) =
      _$RegionPickerStateCopyWithImpl<$Res, RegionPickerState>;
}

/// @nodoc
class _$RegionPickerStateCopyWithImpl<$Res, $Val extends RegionPickerState>
    implements $RegionPickerStateCopyWith<$Res> {
  _$RegionPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RegionPickerStateSuccessCopyWith<$Res> {
  factory _$$_RegionPickerStateSuccessCopyWith(
          _$_RegionPickerStateSuccess value,
          $Res Function(_$_RegionPickerStateSuccess) then) =
      __$$_RegionPickerStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Country> countries});
}

/// @nodoc
class __$$_RegionPickerStateSuccessCopyWithImpl<$Res>
    extends _$RegionPickerStateCopyWithImpl<$Res, _$_RegionPickerStateSuccess>
    implements _$$_RegionPickerStateSuccessCopyWith<$Res> {
  __$$_RegionPickerStateSuccessCopyWithImpl(_$_RegionPickerStateSuccess _value,
      $Res Function(_$_RegionPickerStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countries = null,
  }) {
    return _then(_$_RegionPickerStateSuccess(
      null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// @nodoc

class _$_RegionPickerStateSuccess implements _RegionPickerStateSuccess {
  _$_RegionPickerStateSuccess(final List<Country> countries)
      : _countries = countries;

  final List<Country> _countries;
  @override
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  String toString() {
    return 'RegionPickerState(countries: $countries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionPickerStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_countries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionPickerStateSuccessCopyWith<_$_RegionPickerStateSuccess>
      get copyWith => __$$_RegionPickerStateSuccessCopyWithImpl<
          _$_RegionPickerStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Country> countries) $default, {
    required TResult Function() initial,
  }) {
    return $default(countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Country> countries)? $default, {
    TResult? Function()? initial,
  }) {
    return $default?.call(countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Country> countries)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value) $default, {
    required TResult Function(_RegionPickerStateInitial value) initial,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegionPickerStateSuccess value)? $default, {
    TResult? Function(_RegionPickerStateInitial value)? initial,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value)? $default, {
    TResult Function(_RegionPickerStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _RegionPickerStateSuccess implements RegionPickerState {
  factory _RegionPickerStateSuccess(final List<Country> countries) =
      _$_RegionPickerStateSuccess;

  List<Country> get countries;
  @JsonKey(ignore: true)
  _$$_RegionPickerStateSuccessCopyWith<_$_RegionPickerStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegionPickerStateInitialCopyWith<$Res> {
  factory _$$_RegionPickerStateInitialCopyWith(
          _$_RegionPickerStateInitial value,
          $Res Function(_$_RegionPickerStateInitial) then) =
      __$$_RegionPickerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegionPickerStateInitialCopyWithImpl<$Res>
    extends _$RegionPickerStateCopyWithImpl<$Res, _$_RegionPickerStateInitial>
    implements _$$_RegionPickerStateInitialCopyWith<$Res> {
  __$$_RegionPickerStateInitialCopyWithImpl(_$_RegionPickerStateInitial _value,
      $Res Function(_$_RegionPickerStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegionPickerStateInitial implements _RegionPickerStateInitial {
  _$_RegionPickerStateInitial();

  @override
  String toString() {
    return 'RegionPickerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionPickerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Country> countries) $default, {
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Country> countries)? $default, {
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Country> countries)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value) $default, {
    required TResult Function(_RegionPickerStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegionPickerStateSuccess value)? $default, {
    TResult? Function(_RegionPickerStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegionPickerStateSuccess value)? $default, {
    TResult Function(_RegionPickerStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RegionPickerStateInitial implements RegionPickerState {
  factory _RegionPickerStateInitial() = _$_RegionPickerStateInitial;
}

/// @nodoc
mixin _$RegionPickerEvent {
  IRegion? get region => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IRegion? region) close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IRegion? region)? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IRegion? region)? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegionPickerEventClose value) close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionPickerEventClose value)? close,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionPickerEventClose value)? close,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegionPickerEventCopyWith<RegionPickerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionPickerEventCopyWith<$Res> {
  factory $RegionPickerEventCopyWith(
          RegionPickerEvent value, $Res Function(RegionPickerEvent) then) =
      _$RegionPickerEventCopyWithImpl<$Res, RegionPickerEvent>;
  @useResult
  $Res call({IRegion? region});
}

/// @nodoc
class _$RegionPickerEventCopyWithImpl<$Res, $Val extends RegionPickerEvent>
    implements $RegionPickerEventCopyWith<$Res> {
  _$RegionPickerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = freezed,
  }) {
    return _then(_value.copyWith(
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as IRegion?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionPickerEventCloseCopyWith<$Res>
    implements $RegionPickerEventCopyWith<$Res> {
  factory _$$_RegionPickerEventCloseCopyWith(_$_RegionPickerEventClose value,
          $Res Function(_$_RegionPickerEventClose) then) =
      __$$_RegionPickerEventCloseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IRegion? region});
}

/// @nodoc
class __$$_RegionPickerEventCloseCopyWithImpl<$Res>
    extends _$RegionPickerEventCopyWithImpl<$Res, _$_RegionPickerEventClose>
    implements _$$_RegionPickerEventCloseCopyWith<$Res> {
  __$$_RegionPickerEventCloseCopyWithImpl(_$_RegionPickerEventClose _value,
      $Res Function(_$_RegionPickerEventClose) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = freezed,
  }) {
    return _then(_$_RegionPickerEventClose(
      freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as IRegion?,
    ));
  }
}

/// @nodoc

class _$_RegionPickerEventClose implements _RegionPickerEventClose {
  _$_RegionPickerEventClose([this.region]);

  @override
  final IRegion? region;

  @override
  String toString() {
    return 'RegionPickerEvent.close(region: $region)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionPickerEventClose &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionPickerEventCloseCopyWith<_$_RegionPickerEventClose> get copyWith =>
      __$$_RegionPickerEventCloseCopyWithImpl<_$_RegionPickerEventClose>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IRegion? region) close,
  }) {
    return close(region);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IRegion? region)? close,
  }) {
    return close?.call(region);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IRegion? region)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(region);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegionPickerEventClose value) close,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionPickerEventClose value)? close,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionPickerEventClose value)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _RegionPickerEventClose implements RegionPickerEvent {
  factory _RegionPickerEventClose([final IRegion? region]) =
      _$_RegionPickerEventClose;

  @override
  IRegion? get region;
  @override
  @JsonKey(ignore: true)
  _$$_RegionPickerEventCloseCopyWith<_$_RegionPickerEventClose> get copyWith =>
      throw _privateConstructorUsedError;
}
