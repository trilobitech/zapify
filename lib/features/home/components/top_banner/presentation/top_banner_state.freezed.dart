// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopBannerState {
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
    TResult Function(_TopBannerState value) $default, {
    required TResult Function(_TopBannerStateNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopBannerState value)? $default, {
    TResult? Function(_TopBannerStateNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopBannerState value)? $default, {
    TResult Function(_TopBannerStateNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopBannerStateCopyWith<$Res> {
  factory $TopBannerStateCopyWith(
          TopBannerState value, $Res Function(TopBannerState) then) =
      _$TopBannerStateCopyWithImpl<$Res, TopBannerState>;
}

/// @nodoc
class _$TopBannerStateCopyWithImpl<$Res, $Val extends TopBannerState>
    implements $TopBannerStateCopyWith<$Res> {
  _$TopBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TopBannerStateCopyWith<$Res> {
  factory _$$_TopBannerStateCopyWith(
          _$_TopBannerState value, $Res Function(_$_TopBannerState) then) =
      __$$_TopBannerStateCopyWithImpl<$Res>;
  @useResult
  $Res call({TopBannerType type});
}

/// @nodoc
class __$$_TopBannerStateCopyWithImpl<$Res>
    extends _$TopBannerStateCopyWithImpl<$Res, _$_TopBannerState>
    implements _$$_TopBannerStateCopyWith<$Res> {
  __$$_TopBannerStateCopyWithImpl(
      _$_TopBannerState _value, $Res Function(_$_TopBannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_TopBannerState(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TopBannerType,
    ));
  }
}

/// @nodoc

class _$_TopBannerState implements _TopBannerState {
  _$_TopBannerState({required this.type});

  @override
  final TopBannerType type;

  @override
  String toString() {
    return 'TopBannerState(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopBannerState &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopBannerStateCopyWith<_$_TopBannerState> get copyWith =>
      __$$_TopBannerStateCopyWithImpl<_$_TopBannerState>(this, _$identity);

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
    TResult Function(_TopBannerState value) $default, {
    required TResult Function(_TopBannerStateNone value) none,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopBannerState value)? $default, {
    TResult? Function(_TopBannerStateNone value)? none,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopBannerState value)? $default, {
    TResult Function(_TopBannerStateNone value)? none,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _TopBannerState implements TopBannerState {
  factory _TopBannerState({required final TopBannerType type}) =
      _$_TopBannerState;

  TopBannerType get type;
  @JsonKey(ignore: true)
  _$$_TopBannerStateCopyWith<_$_TopBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TopBannerStateNoneCopyWith<$Res> {
  factory _$$_TopBannerStateNoneCopyWith(_$_TopBannerStateNone value,
          $Res Function(_$_TopBannerStateNone) then) =
      __$$_TopBannerStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TopBannerStateNoneCopyWithImpl<$Res>
    extends _$TopBannerStateCopyWithImpl<$Res, _$_TopBannerStateNone>
    implements _$$_TopBannerStateNoneCopyWith<$Res> {
  __$$_TopBannerStateNoneCopyWithImpl(
      _$_TopBannerStateNone _value, $Res Function(_$_TopBannerStateNone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TopBannerStateNone implements _TopBannerStateNone {
  _$_TopBannerStateNone();

  @override
  String toString() {
    return 'TopBannerState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TopBannerStateNone);
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
    TResult Function(_TopBannerState value) $default, {
    required TResult Function(_TopBannerStateNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopBannerState value)? $default, {
    TResult? Function(_TopBannerStateNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopBannerState value)? $default, {
    TResult Function(_TopBannerStateNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _TopBannerStateNone implements TopBannerState {
  factory _TopBannerStateNone() = _$_TopBannerStateNone;
}
