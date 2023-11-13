// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ad_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdBannerState {
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
    TResult Function(_AdBannerState value) $default, {
    required TResult Function(_AdBannerStateNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerState value)? $default, {
    TResult? Function(_AdBannerStateNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerState value)? $default, {
    TResult Function(_AdBannerStateNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdBannerStateCopyWith<$Res> {
  factory $AdBannerStateCopyWith(
          AdBannerState value, $Res Function(AdBannerState) then) =
      _$AdBannerStateCopyWithImpl<$Res, AdBannerState>;
}

/// @nodoc
class _$AdBannerStateCopyWithImpl<$Res, $Val extends AdBannerState>
    implements $AdBannerStateCopyWith<$Res> {
  _$AdBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AdBannerStateCopyWith<$Res> {
  factory _$$_AdBannerStateCopyWith(
          _$_AdBannerState value, $Res Function(_$_AdBannerState) then) =
      __$$_AdBannerStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String unitId});
}

/// @nodoc
class __$$_AdBannerStateCopyWithImpl<$Res>
    extends _$AdBannerStateCopyWithImpl<$Res, _$_AdBannerState>
    implements _$$_AdBannerStateCopyWith<$Res> {
  __$$_AdBannerStateCopyWithImpl(
      _$_AdBannerState _value, $Res Function(_$_AdBannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitId = null,
  }) {
    return _then(_$_AdBannerState(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdBannerState implements _AdBannerState {
  _$_AdBannerState({required this.unitId});

  @override
  final String unitId;

  @override
  String toString() {
    return 'AdBannerState(unitId: $unitId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdBannerState &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unitId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdBannerStateCopyWith<_$_AdBannerState> get copyWith =>
      __$$_AdBannerStateCopyWithImpl<_$_AdBannerState>(this, _$identity);

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
    TResult Function(_AdBannerState value) $default, {
    required TResult Function(_AdBannerStateNone value) none,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerState value)? $default, {
    TResult? Function(_AdBannerStateNone value)? none,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerState value)? $default, {
    TResult Function(_AdBannerStateNone value)? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AdBannerState implements AdBannerState {
  factory _AdBannerState({required final String unitId}) = _$_AdBannerState;

  String get unitId;
  @JsonKey(ignore: true)
  _$$_AdBannerStateCopyWith<_$_AdBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AdBannerStateNoneCopyWith<$Res> {
  factory _$$_AdBannerStateNoneCopyWith(_$_AdBannerStateNone value,
          $Res Function(_$_AdBannerStateNone) then) =
      __$$_AdBannerStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AdBannerStateNoneCopyWithImpl<$Res>
    extends _$AdBannerStateCopyWithImpl<$Res, _$_AdBannerStateNone>
    implements _$$_AdBannerStateNoneCopyWith<$Res> {
  __$$_AdBannerStateNoneCopyWithImpl(
      _$_AdBannerStateNone _value, $Res Function(_$_AdBannerStateNone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AdBannerStateNone implements _AdBannerStateNone {
  _$_AdBannerStateNone();

  @override
  String toString() {
    return 'AdBannerState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AdBannerStateNone);
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
    TResult Function(_AdBannerState value) $default, {
    required TResult Function(_AdBannerStateNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerState value)? $default, {
    TResult? Function(_AdBannerStateNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerState value)? $default, {
    TResult Function(_AdBannerStateNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _AdBannerStateNone implements AdBannerState {
  factory _AdBannerStateNone() = _$_AdBannerStateNone;
}
