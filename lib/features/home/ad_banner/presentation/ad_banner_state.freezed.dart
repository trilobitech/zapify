// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AdBannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(TResult Function(String unitId) $default, {required TResult Function() none}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String unitId)? $default, {
    TResult? Function()? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String unitId)? $default, {
    TResult Function()? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdBannerState value) $default, {
    required TResult Function(_AdBannerStateNone value) none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdBannerState value)? $default, {
    TResult? Function(_AdBannerStateNone value)? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdBannerState value)? $default, {
    TResult Function(_AdBannerStateNone value)? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdBannerStateCopyWith<$Res> {
  factory $AdBannerStateCopyWith(AdBannerState value, $Res Function(AdBannerState) then) =
      _$AdBannerStateCopyWithImpl<$Res, AdBannerState>;
}

/// @nodoc
class _$AdBannerStateCopyWithImpl<$Res, $Val extends AdBannerState> implements $AdBannerStateCopyWith<$Res> {
  _$AdBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdBannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdBannerStateImplCopyWith<$Res> {
  factory _$$AdBannerStateImplCopyWith(_$AdBannerStateImpl value, $Res Function(_$AdBannerStateImpl) then) =
      __$$AdBannerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String unitId});
}

/// @nodoc
class __$$AdBannerStateImplCopyWithImpl<$Res> extends _$AdBannerStateCopyWithImpl<$Res, _$AdBannerStateImpl>
    implements _$$AdBannerStateImplCopyWith<$Res> {
  __$$AdBannerStateImplCopyWithImpl(_$AdBannerStateImpl _value, $Res Function(_$AdBannerStateImpl) _then)
    : super(_value, _then);

  /// Create a copy of AdBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? unitId = null}) {
    return _then(
      _$AdBannerStateImpl(
        unitId:
            null == unitId
                ? _value.unitId
                : unitId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$AdBannerStateImpl implements _AdBannerState {
  _$AdBannerStateImpl({required this.unitId});

  @override
  final String unitId;

  @override
  String toString() {
    return 'AdBannerState(unitId: $unitId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdBannerStateImpl &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unitId);

  /// Create a copy of AdBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdBannerStateImplCopyWith<_$AdBannerStateImpl> get copyWith =>
      __$$AdBannerStateImplCopyWithImpl<_$AdBannerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(TResult Function(String unitId) $default, {required TResult Function() none}) {
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
  factory _AdBannerState({required final String unitId}) = _$AdBannerStateImpl;

  String get unitId;

  /// Create a copy of AdBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdBannerStateImplCopyWith<_$AdBannerStateImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdBannerStateNoneImplCopyWith<$Res> {
  factory _$$AdBannerStateNoneImplCopyWith(_$AdBannerStateNoneImpl value, $Res Function(_$AdBannerStateNoneImpl) then) =
      __$$AdBannerStateNoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdBannerStateNoneImplCopyWithImpl<$Res> extends _$AdBannerStateCopyWithImpl<$Res, _$AdBannerStateNoneImpl>
    implements _$$AdBannerStateNoneImplCopyWith<$Res> {
  __$$AdBannerStateNoneImplCopyWithImpl(_$AdBannerStateNoneImpl _value, $Res Function(_$AdBannerStateNoneImpl) _then)
    : super(_value, _then);

  /// Create a copy of AdBannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AdBannerStateNoneImpl implements _AdBannerStateNone {
  _$AdBannerStateNoneImpl();

  @override
  String toString() {
    return 'AdBannerState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$AdBannerStateNoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(TResult Function(String unitId) $default, {required TResult Function() none}) {
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
  factory _AdBannerStateNone() = _$AdBannerStateNoneImpl;
}
