// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsAction {
  String get route => throw _privateConstructorUsedError;
  Object? get args => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(String route, Object? args) navigateTo}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(String route, Object? args)? navigateTo}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String route, Object? args)? navigateTo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_SettingsActionNavigateTo value) navigateTo}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_SettingsActionNavigateTo value)? navigateTo}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsActionNavigateTo value)? navigateTo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of SettingsAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsActionCopyWith<SettingsAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsActionCopyWith<$Res> {
  factory $SettingsActionCopyWith(SettingsAction value, $Res Function(SettingsAction) then) =
      _$SettingsActionCopyWithImpl<$Res, SettingsAction>;
  @useResult
  $Res call({String route, Object? args});
}

/// @nodoc
class _$SettingsActionCopyWithImpl<$Res, $Val extends SettingsAction> implements $SettingsActionCopyWith<$Res> {
  _$SettingsActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? route = null, Object? args = freezed}) {
    return _then(
      _value.copyWith(
            route:
                null == route
                    ? _value.route
                    : route // ignore: cast_nullable_to_non_nullable
                        as String,
            args: freezed == args ? _value.args : args,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsActionNavigateToImplCopyWith<$Res> implements $SettingsActionCopyWith<$Res> {
  factory _$$SettingsActionNavigateToImplCopyWith(
    _$SettingsActionNavigateToImpl value,
    $Res Function(_$SettingsActionNavigateToImpl) then,
  ) = __$$SettingsActionNavigateToImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route, Object? args});
}

/// @nodoc
class __$$SettingsActionNavigateToImplCopyWithImpl<$Res>
    extends _$SettingsActionCopyWithImpl<$Res, _$SettingsActionNavigateToImpl>
    implements _$$SettingsActionNavigateToImplCopyWith<$Res> {
  __$$SettingsActionNavigateToImplCopyWithImpl(
    _$SettingsActionNavigateToImpl _value,
    $Res Function(_$SettingsActionNavigateToImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? route = null, Object? args = freezed}) {
    return _then(
      _$SettingsActionNavigateToImpl(
        null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                as String,
        args: freezed == args ? _value.args : args,
      ),
    );
  }
}

/// @nodoc

class _$SettingsActionNavigateToImpl implements _SettingsActionNavigateTo {
  _$SettingsActionNavigateToImpl(this.route, {this.args = null});

  @override
  final String route;
  @override
  @JsonKey()
  final Object? args;

  @override
  String toString() {
    return 'SettingsAction.navigateTo(route: $route, args: $args)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsActionNavigateToImpl &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route, const DeepCollectionEquality().hash(args));

  /// Create a copy of SettingsAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsActionNavigateToImplCopyWith<_$SettingsActionNavigateToImpl> get copyWith =>
      __$$SettingsActionNavigateToImplCopyWithImpl<_$SettingsActionNavigateToImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(String route, Object? args) navigateTo}) {
    return navigateTo(route, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(String route, Object? args)? navigateTo}) {
    return navigateTo?.call(route, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String route, Object? args)? navigateTo,
    required TResult orElse(),
  }) {
    if (navigateTo != null) {
      return navigateTo(route, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_SettingsActionNavigateTo value) navigateTo}) {
    return navigateTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_SettingsActionNavigateTo value)? navigateTo}) {
    return navigateTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsActionNavigateTo value)? navigateTo,
    required TResult orElse(),
  }) {
    if (navigateTo != null) {
      return navigateTo(this);
    }
    return orElse();
  }
}

abstract class _SettingsActionNavigateTo implements SettingsAction {
  factory _SettingsActionNavigateTo(final String route, {final Object? args}) = _$SettingsActionNavigateToImpl;

  @override
  String get route;
  @override
  Object? get args;

  /// Create a copy of SettingsAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsActionNavigateToImplCopyWith<_$SettingsActionNavigateToImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
