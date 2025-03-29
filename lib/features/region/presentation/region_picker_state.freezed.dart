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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegionPickerState {
  List<Country> get countries => throw _privateConstructorUsedError;

  /// Create a copy of RegionPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionPickerStateCopyWith<RegionPickerState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionPickerStateCopyWith<$Res> {
  factory $RegionPickerStateCopyWith(RegionPickerState value, $Res Function(RegionPickerState) then) =
      _$RegionPickerStateCopyWithImpl<$Res, RegionPickerState>;
  @useResult
  $Res call({List<Country> countries});
}

/// @nodoc
class _$RegionPickerStateCopyWithImpl<$Res, $Val extends RegionPickerState>
    implements $RegionPickerStateCopyWith<$Res> {
  _$RegionPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? countries = null}) {
    return _then(
      _value.copyWith(
            countries:
                null == countries
                    ? _value.countries
                    : countries // ignore: cast_nullable_to_non_nullable
                        as List<Country>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegionPickerStateSuccessImplCopyWith<$Res> implements $RegionPickerStateCopyWith<$Res> {
  factory _$$RegionPickerStateSuccessImplCopyWith(
    _$RegionPickerStateSuccessImpl value,
    $Res Function(_$RegionPickerStateSuccessImpl) then,
  ) = __$$RegionPickerStateSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Country> countries});
}

/// @nodoc
class __$$RegionPickerStateSuccessImplCopyWithImpl<$Res>
    extends _$RegionPickerStateCopyWithImpl<$Res, _$RegionPickerStateSuccessImpl>
    implements _$$RegionPickerStateSuccessImplCopyWith<$Res> {
  __$$RegionPickerStateSuccessImplCopyWithImpl(
    _$RegionPickerStateSuccessImpl _value,
    $Res Function(_$RegionPickerStateSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegionPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? countries = null}) {
    return _then(
      _$RegionPickerStateSuccessImpl(
        countries:
            null == countries
                ? _value._countries
                : countries // ignore: cast_nullable_to_non_nullable
                    as List<Country>,
      ),
    );
  }
}

/// @nodoc

class _$RegionPickerStateSuccessImpl implements _RegionPickerStateSuccess {
  _$RegionPickerStateSuccessImpl({final List<Country> countries = const []}) : _countries = countries;

  final List<Country> _countries;
  @override
  @JsonKey()
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionPickerStateSuccessImpl &&
            const DeepCollectionEquality().equals(other._countries, _countries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_countries));

  /// Create a copy of RegionPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionPickerStateSuccessImplCopyWith<_$RegionPickerStateSuccessImpl> get copyWith =>
      __$$RegionPickerStateSuccessImplCopyWithImpl<_$RegionPickerStateSuccessImpl>(this, _$identity);
}

abstract class _RegionPickerStateSuccess implements RegionPickerState {
  factory _RegionPickerStateSuccess({final List<Country> countries}) = _$RegionPickerStateSuccessImpl;

  @override
  List<Country> get countries;

  /// Create a copy of RegionPickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionPickerStateSuccessImplCopyWith<_$RegionPickerStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegionPickerAction {
  IRegion? get region => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(IRegion? region) close}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(IRegion? region)? close}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({TResult Function(IRegion? region)? close, required TResult orElse()}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_RegionPickerActionClose value) close}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_RegionPickerActionClose value)? close}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionPickerActionClose value)? close,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of RegionPickerAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionPickerActionCopyWith<RegionPickerAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionPickerActionCopyWith<$Res> {
  factory $RegionPickerActionCopyWith(RegionPickerAction value, $Res Function(RegionPickerAction) then) =
      _$RegionPickerActionCopyWithImpl<$Res, RegionPickerAction>;
  @useResult
  $Res call({IRegion? region});
}

/// @nodoc
class _$RegionPickerActionCopyWithImpl<$Res, $Val extends RegionPickerAction>
    implements $RegionPickerActionCopyWith<$Res> {
  _$RegionPickerActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionPickerAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? region = freezed}) {
    return _then(
      _value.copyWith(
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as IRegion?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegionPickerActionCloseImplCopyWith<$Res> implements $RegionPickerActionCopyWith<$Res> {
  factory _$$RegionPickerActionCloseImplCopyWith(
    _$RegionPickerActionCloseImpl value,
    $Res Function(_$RegionPickerActionCloseImpl) then,
  ) = __$$RegionPickerActionCloseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IRegion? region});
}

/// @nodoc
class __$$RegionPickerActionCloseImplCopyWithImpl<$Res>
    extends _$RegionPickerActionCopyWithImpl<$Res, _$RegionPickerActionCloseImpl>
    implements _$$RegionPickerActionCloseImplCopyWith<$Res> {
  __$$RegionPickerActionCloseImplCopyWithImpl(
    _$RegionPickerActionCloseImpl _value,
    $Res Function(_$RegionPickerActionCloseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegionPickerAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? region = freezed}) {
    return _then(
      _$RegionPickerActionCloseImpl(
        freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                as IRegion?,
      ),
    );
  }
}

/// @nodoc

class _$RegionPickerActionCloseImpl implements _RegionPickerActionClose {
  _$RegionPickerActionCloseImpl([this.region]);

  @override
  final IRegion? region;

  @override
  String toString() {
    return 'RegionPickerAction.close(region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionPickerActionCloseImpl &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  /// Create a copy of RegionPickerAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionPickerActionCloseImplCopyWith<_$RegionPickerActionCloseImpl> get copyWith =>
      __$$RegionPickerActionCloseImplCopyWithImpl<_$RegionPickerActionCloseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(IRegion? region) close}) {
    return close(region);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(IRegion? region)? close}) {
    return close?.call(region);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({TResult Function(IRegion? region)? close, required TResult orElse()}) {
    if (close != null) {
      return close(region);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_RegionPickerActionClose value) close}) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_RegionPickerActionClose value)? close}) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionPickerActionClose value)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _RegionPickerActionClose implements RegionPickerAction {
  factory _RegionPickerActionClose([final IRegion? region]) = _$RegionPickerActionCloseImpl;

  @override
  IRegion? get region;

  /// Create a copy of RegionPickerAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionPickerActionCloseImplCopyWith<_$RegionPickerActionCloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
