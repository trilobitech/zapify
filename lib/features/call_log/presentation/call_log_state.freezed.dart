// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CallLogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogStateCopyWith<$Res> {
  factory $CallLogStateCopyWith(CallLogState value, $Res Function(CallLogState) then) =
      _$CallLogStateCopyWithImpl<$Res, CallLogState>;
}

/// @nodoc
class _$CallLogStateCopyWithImpl<$Res, $Val extends CallLogState> implements $CallLogStateCopyWith<$Res> {
  _$CallLogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CallLogStatePopulatedImplCopyWith<$Res> {
  factory _$$CallLogStatePopulatedImplCopyWith(
    _$CallLogStatePopulatedImpl value,
    $Res Function(_$CallLogStatePopulatedImpl) then,
  ) = __$$CallLogStatePopulatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<CallEntry> entries});
}

/// @nodoc
class __$$CallLogStatePopulatedImplCopyWithImpl<$Res>
    extends _$CallLogStateCopyWithImpl<$Res, _$CallLogStatePopulatedImpl>
    implements _$$CallLogStatePopulatedImplCopyWith<$Res> {
  __$$CallLogStatePopulatedImplCopyWithImpl(
    _$CallLogStatePopulatedImpl _value,
    $Res Function(_$CallLogStatePopulatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entries = null}) {
    return _then(
      _$CallLogStatePopulatedImpl(
        entries:
            null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                    as Iterable<CallEntry>,
      ),
    );
  }
}

/// @nodoc

class _$CallLogStatePopulatedImpl implements _CallLogStatePopulated {
  _$CallLogStatePopulatedImpl({required this.entries});

  @override
  final Iterable<CallEntry> entries;

  @override
  String toString() {
    return 'CallLogState(entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogStatePopulatedImpl &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogStatePopulatedImplCopyWith<_$CallLogStatePopulatedImpl> get copyWith =>
      __$$CallLogStatePopulatedImplCopyWithImpl<_$CallLogStatePopulatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) {
    return $default(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) {
    return $default?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CallLogStatePopulated implements CallLogState {
  factory _CallLogStatePopulated({required final Iterable<CallEntry> entries}) = _$CallLogStatePopulatedImpl;

  Iterable<CallEntry> get entries;

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogStatePopulatedImplCopyWith<_$CallLogStatePopulatedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CallLogStateEmptyImplCopyWith<$Res> {
  factory _$$CallLogStateEmptyImplCopyWith(_$CallLogStateEmptyImpl value, $Res Function(_$CallLogStateEmptyImpl) then) =
      __$$CallLogStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CallLogStateEmptyImplCopyWithImpl<$Res> extends _$CallLogStateCopyWithImpl<$Res, _$CallLogStateEmptyImpl>
    implements _$$CallLogStateEmptyImplCopyWith<$Res> {
  __$$CallLogStateEmptyImplCopyWithImpl(_$CallLogStateEmptyImpl _value, $Res Function(_$CallLogStateEmptyImpl) _then)
    : super(_value, _then);

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CallLogStateEmptyImpl implements _CallLogStateEmpty {
  _$CallLogStateEmptyImpl();

  @override
  String toString() {
    return 'CallLogState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$CallLogStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _CallLogStateEmpty implements CallLogState {
  factory _CallLogStateEmpty() = _$CallLogStateEmptyImpl;
}

/// @nodoc
abstract class _$$CallLogStateErrorImplCopyWith<$Res> {
  factory _$$CallLogStateErrorImplCopyWith(_$CallLogStateErrorImpl value, $Res Function(_$CallLogStateErrorImpl) then) =
      __$$CallLogStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$CallLogStateErrorImplCopyWithImpl<$Res> extends _$CallLogStateCopyWithImpl<$Res, _$CallLogStateErrorImpl>
    implements _$$CallLogStateErrorImplCopyWith<$Res> {
  __$$CallLogStateErrorImplCopyWithImpl(_$CallLogStateErrorImpl _value, $Res Function(_$CallLogStateErrorImpl) _then)
    : super(_value, _then);

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = freezed}) {
    return _then(
      _$CallLogStateErrorImpl(
        freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as dynamic,
      ),
    );
  }
}

/// @nodoc

class _$CallLogStateErrorImpl implements _CallLogStateError {
  _$CallLogStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CallLogState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogStateErrorImplCopyWith<_$CallLogStateErrorImpl> get copyWith =>
      __$$CallLogStateErrorImplCopyWithImpl<_$CallLogStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CallLogStateError implements CallLogState {
  factory _CallLogStateError(final dynamic error) = _$CallLogStateErrorImpl;

  dynamic get error;

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogStateErrorImplCopyWith<_$CallLogStateErrorImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CallLogStateLoadingImplCopyWith<$Res> {
  factory _$$CallLogStateLoadingImplCopyWith(
    _$CallLogStateLoadingImpl value,
    $Res Function(_$CallLogStateLoadingImpl) then,
  ) = __$$CallLogStateLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemCount});
}

/// @nodoc
class __$$CallLogStateLoadingImplCopyWithImpl<$Res> extends _$CallLogStateCopyWithImpl<$Res, _$CallLogStateLoadingImpl>
    implements _$$CallLogStateLoadingImplCopyWith<$Res> {
  __$$CallLogStateLoadingImplCopyWithImpl(
    _$CallLogStateLoadingImpl _value,
    $Res Function(_$CallLogStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? itemCount = null}) {
    return _then(
      _$CallLogStateLoadingImpl(
        null == itemCount
            ? _value.itemCount
            : itemCount // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$CallLogStateLoadingImpl implements _CallLogStateLoading {
  _$CallLogStateLoadingImpl(this.itemCount);

  @override
  final int itemCount;

  @override
  String toString() {
    return 'CallLogState.loading(itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogStateLoadingImpl &&
            (identical(other.itemCount, itemCount) || other.itemCount == itemCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemCount);

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogStateLoadingImplCopyWith<_$CallLogStateLoadingImpl> get copyWith =>
      __$$CallLogStateLoadingImplCopyWithImpl<_$CallLogStateLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) {
    return loading(itemCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) {
    return loading?.call(itemCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(itemCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CallLogStateLoading implements CallLogState {
  factory _CallLogStateLoading(final int itemCount) = _$CallLogStateLoadingImpl;

  int get itemCount;

  /// Create a copy of CallLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogStateLoadingImplCopyWith<_$CallLogStateLoadingImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CallLogAction {
  CallEntry get entry => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(CallEntry entry) select}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(CallEntry entry)? select}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({TResult Function(CallEntry entry)? select, required TResult orElse()}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_CallLogActionEntrySelect value) select}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_CallLogActionEntrySelect value)? select}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CallLogActionEntrySelect value)? select,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CallLogAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogActionCopyWith<CallLogAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogActionCopyWith<$Res> {
  factory $CallLogActionCopyWith(CallLogAction value, $Res Function(CallLogAction) then) =
      _$CallLogActionCopyWithImpl<$Res, CallLogAction>;
  @useResult
  $Res call({CallEntry entry});
}

/// @nodoc
class _$CallLogActionCopyWithImpl<$Res, $Val extends CallLogAction> implements $CallLogActionCopyWith<$Res> {
  _$CallLogActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _value.copyWith(
            entry:
                null == entry
                    ? _value.entry
                    : entry // ignore: cast_nullable_to_non_nullable
                        as CallEntry,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallLogActionEntrySelectImplCopyWith<$Res> implements $CallLogActionCopyWith<$Res> {
  factory _$$CallLogActionEntrySelectImplCopyWith(
    _$CallLogActionEntrySelectImpl value,
    $Res Function(_$CallLogActionEntrySelectImpl) then,
  ) = __$$CallLogActionEntrySelectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CallEntry entry});
}

/// @nodoc
class __$$CallLogActionEntrySelectImplCopyWithImpl<$Res>
    extends _$CallLogActionCopyWithImpl<$Res, _$CallLogActionEntrySelectImpl>
    implements _$$CallLogActionEntrySelectImplCopyWith<$Res> {
  __$$CallLogActionEntrySelectImplCopyWithImpl(
    _$CallLogActionEntrySelectImpl _value,
    $Res Function(_$CallLogActionEntrySelectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _$CallLogActionEntrySelectImpl(
        null == entry
            ? _value.entry
            : entry // ignore: cast_nullable_to_non_nullable
                as CallEntry,
      ),
    );
  }
}

/// @nodoc

class _$CallLogActionEntrySelectImpl implements _CallLogActionEntrySelect {
  _$CallLogActionEntrySelectImpl(this.entry);

  @override
  final CallEntry entry;

  @override
  String toString() {
    return 'CallLogAction.select(entry: $entry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogActionEntrySelectImpl &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  /// Create a copy of CallLogAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogActionEntrySelectImplCopyWith<_$CallLogActionEntrySelectImpl> get copyWith =>
      __$$CallLogActionEntrySelectImplCopyWithImpl<_$CallLogActionEntrySelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function(CallEntry entry) select}) {
    return select(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function(CallEntry entry)? select}) {
    return select?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({TResult Function(CallEntry entry)? select, required TResult orElse()}) {
    if (select != null) {
      return select(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({required TResult Function(_CallLogActionEntrySelect value) select}) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({TResult? Function(_CallLogActionEntrySelect value)? select}) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CallLogActionEntrySelect value)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _CallLogActionEntrySelect implements CallLogAction {
  factory _CallLogActionEntrySelect(final CallEntry entry) = _$CallLogActionEntrySelectImpl;

  @override
  CallEntry get entry;

  /// Create a copy of CallLogAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogActionEntrySelectImplCopyWith<_$CallLogActionEntrySelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
