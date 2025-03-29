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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeAction {
  String? get current => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(String? current) navigateToRegionPicker}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(String? current)? navigateToRegionPicker}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? current)? navigateToRegionPicker,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeActionNavigateToRegionPicker value) navigateToRegionPicker,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeActionNavigateToRegionPicker value)? navigateToRegionPicker,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeActionNavigateToRegionPicker value)? navigateToRegionPicker,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HomeAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeActionCopyWith<HomeAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeActionCopyWith<$Res> {
  factory $HomeActionCopyWith(HomeAction value, $Res Function(HomeAction) then) =
      _$HomeActionCopyWithImpl<$Res, HomeAction>;
  @useResult
  $Res call({String? current});
}

/// @nodoc
class _$HomeActionCopyWithImpl<$Res, $Val extends HomeAction> implements $HomeActionCopyWith<$Res> {
  _$HomeActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? current = freezed}) {
    return _then(
      _value.copyWith(
            current:
                freezed == current
                    ? _value.current
                    : current // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeActionNavigateToRegionPickerImplCopyWith<$Res> implements $HomeActionCopyWith<$Res> {
  factory _$$HomeActionNavigateToRegionPickerImplCopyWith(
    _$HomeActionNavigateToRegionPickerImpl value,
    $Res Function(_$HomeActionNavigateToRegionPickerImpl) then,
  ) = __$$HomeActionNavigateToRegionPickerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? current});
}

/// @nodoc
class __$$HomeActionNavigateToRegionPickerImplCopyWithImpl<$Res>
    extends _$HomeActionCopyWithImpl<$Res, _$HomeActionNavigateToRegionPickerImpl>
    implements _$$HomeActionNavigateToRegionPickerImplCopyWith<$Res> {
  __$$HomeActionNavigateToRegionPickerImplCopyWithImpl(
    _$HomeActionNavigateToRegionPickerImpl _value,
    $Res Function(_$HomeActionNavigateToRegionPickerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? current = freezed}) {
    return _then(
      _$HomeActionNavigateToRegionPickerImpl(
        freezed == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeActionNavigateToRegionPickerImpl implements _HomeActionNavigateToRegionPicker {
  _$HomeActionNavigateToRegionPickerImpl(this.current);

  @override
  final String? current;

  @override
  String toString() {
    return 'HomeAction.navigateToRegionPicker(current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeActionNavigateToRegionPickerImpl &&
            (identical(other.current, current) || other.current == current));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current);

  /// Create a copy of HomeAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeActionNavigateToRegionPickerImplCopyWith<_$HomeActionNavigateToRegionPickerImpl> get copyWith =>
      __$$HomeActionNavigateToRegionPickerImplCopyWithImpl<_$HomeActionNavigateToRegionPickerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(String? current) navigateToRegionPicker}) {
    return navigateToRegionPicker(current);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(String? current)? navigateToRegionPicker}) {
    return navigateToRegionPicker?.call(current);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? current)? navigateToRegionPicker,
    required TResult orElse(),
  }) {
    if (navigateToRegionPicker != null) {
      return navigateToRegionPicker(current);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeActionNavigateToRegionPicker value) navigateToRegionPicker,
  }) {
    return navigateToRegionPicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeActionNavigateToRegionPicker value)? navigateToRegionPicker,
  }) {
    return navigateToRegionPicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeActionNavigateToRegionPicker value)? navigateToRegionPicker,
    required TResult orElse(),
  }) {
    if (navigateToRegionPicker != null) {
      return navigateToRegionPicker(this);
    }
    return orElse();
  }
}

abstract class _HomeActionNavigateToRegionPicker implements HomeAction {
  factory _HomeActionNavigateToRegionPicker(final String? current) = _$HomeActionNavigateToRegionPickerImpl;

  @override
  String? get current;

  /// Create a copy of HomeAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeActionNavigateToRegionPickerImplCopyWith<_$HomeActionNavigateToRegionPickerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
