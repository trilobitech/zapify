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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TopBannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TopBannerType type) $default, {
    required TResult Function() none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TopBannerType type)? $default, {
    TResult? Function()? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TopBannerType type)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TopBannerState value) $default, {
    required TResult Function(_TopBannerStateNone value) none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopBannerState value)? $default, {
    TResult? Function(_TopBannerStateNone value)? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopBannerState value)? $default, {
    TResult Function(_TopBannerStateNone value)? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopBannerStateCopyWith<$Res> {
  factory $TopBannerStateCopyWith(TopBannerState value, $Res Function(TopBannerState) then) =
      _$TopBannerStateCopyWithImpl<$Res, TopBannerState>;
}

/// @nodoc
class _$TopBannerStateCopyWithImpl<$Res, $Val extends TopBannerState> implements $TopBannerStateCopyWith<$Res> {
  _$TopBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopBannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TopBannerStateImplCopyWith<$Res> {
  factory _$$TopBannerStateImplCopyWith(_$TopBannerStateImpl value, $Res Function(_$TopBannerStateImpl) then) =
      __$$TopBannerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TopBannerType type});
}

/// @nodoc
class __$$TopBannerStateImplCopyWithImpl<$Res> extends _$TopBannerStateCopyWithImpl<$Res, _$TopBannerStateImpl>
    implements _$$TopBannerStateImplCopyWith<$Res> {
  __$$TopBannerStateImplCopyWithImpl(_$TopBannerStateImpl _value, $Res Function(_$TopBannerStateImpl) _then)
    : super(_value, _then);

  /// Create a copy of TopBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _$TopBannerStateImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as TopBannerType,
      ),
    );
  }
}

/// @nodoc

class _$TopBannerStateImpl implements _TopBannerState {
  _$TopBannerStateImpl({required this.type});

  @override
  final TopBannerType type;

  @override
  String toString() {
    return 'TopBannerState(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopBannerStateImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of TopBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopBannerStateImplCopyWith<_$TopBannerStateImpl> get copyWith =>
      __$$TopBannerStateImplCopyWithImpl<_$TopBannerStateImpl>(this, _$identity);

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
  factory _TopBannerState({required final TopBannerType type}) = _$TopBannerStateImpl;

  TopBannerType get type;

  /// Create a copy of TopBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopBannerStateImplCopyWith<_$TopBannerStateImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TopBannerStateNoneImplCopyWith<$Res> {
  factory _$$TopBannerStateNoneImplCopyWith(
    _$TopBannerStateNoneImpl value,
    $Res Function(_$TopBannerStateNoneImpl) then,
  ) = __$$TopBannerStateNoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TopBannerStateNoneImplCopyWithImpl<$Res> extends _$TopBannerStateCopyWithImpl<$Res, _$TopBannerStateNoneImpl>
    implements _$$TopBannerStateNoneImplCopyWith<$Res> {
  __$$TopBannerStateNoneImplCopyWithImpl(_$TopBannerStateNoneImpl _value, $Res Function(_$TopBannerStateNoneImpl) _then)
    : super(_value, _then);

  /// Create a copy of TopBannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TopBannerStateNoneImpl implements _TopBannerStateNone {
  _$TopBannerStateNoneImpl();

  @override
  String toString() {
    return 'TopBannerState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$TopBannerStateNoneImpl);
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
  factory _TopBannerStateNone() = _$TopBannerStateNoneImpl;
}
