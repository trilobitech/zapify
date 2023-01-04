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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallLogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries) $default, {
    required TResult Function() empty,
    required TResult Function(dynamic error) error,
    required TResult Function(int itemCount) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Iterable<CallEntry> entries)? $default, {
    TResult? Function()? empty,
    TResult? Function(dynamic error)? error,
    TResult? Function(int itemCount)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<CallEntry> entries)? $default, {
    TResult Function()? empty,
    TResult Function(dynamic error)? error,
    TResult Function(int itemCount)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value) $default, {
    required TResult Function(_CallLogStateEmpty value) empty,
    required TResult Function(_CallLogStateError value) error,
    required TResult Function(_CallLogStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CallLogStatePopulated value)? $default, {
    TResult? Function(_CallLogStateEmpty value)? empty,
    TResult? Function(_CallLogStateError value)? error,
    TResult? Function(_CallLogStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CallLogStatePopulated value)? $default, {
    TResult Function(_CallLogStateEmpty value)? empty,
    TResult Function(_CallLogStateError value)? error,
    TResult Function(_CallLogStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogStateCopyWith<$Res> {
  factory $CallLogStateCopyWith(
          CallLogState value, $Res Function(CallLogState) then) =
      _$CallLogStateCopyWithImpl<$Res, CallLogState>;
}

/// @nodoc
class _$CallLogStateCopyWithImpl<$Res, $Val extends CallLogState>
    implements $CallLogStateCopyWith<$Res> {
  _$CallLogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CallLogStatePopulatedCopyWith<$Res> {
  factory _$$_CallLogStatePopulatedCopyWith(_$_CallLogStatePopulated value,
          $Res Function(_$_CallLogStatePopulated) then) =
      __$$_CallLogStatePopulatedCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<CallEntry> entries});
}

/// @nodoc
class __$$_CallLogStatePopulatedCopyWithImpl<$Res>
    extends _$CallLogStateCopyWithImpl<$Res, _$_CallLogStatePopulated>
    implements _$$_CallLogStatePopulatedCopyWith<$Res> {
  __$$_CallLogStatePopulatedCopyWithImpl(_$_CallLogStatePopulated _value,
      $Res Function(_$_CallLogStatePopulated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$_CallLogStatePopulated(
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Iterable<CallEntry>,
    ));
  }
}

/// @nodoc

class _$_CallLogStatePopulated implements _CallLogStatePopulated {
  _$_CallLogStatePopulated({required this.entries});

  @override
  final Iterable<CallEntry> entries;

  @override
  String toString() {
    return 'CallLogState(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallLogStatePopulated &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallLogStatePopulatedCopyWith<_$_CallLogStatePopulated> get copyWith =>
      __$$_CallLogStatePopulatedCopyWithImpl<_$_CallLogStatePopulated>(
          this, _$identity);

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
  factory _CallLogStatePopulated({required final Iterable<CallEntry> entries}) =
      _$_CallLogStatePopulated;

  Iterable<CallEntry> get entries;
  @JsonKey(ignore: true)
  _$$_CallLogStatePopulatedCopyWith<_$_CallLogStatePopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CallLogStateEmptyCopyWith<$Res> {
  factory _$$_CallLogStateEmptyCopyWith(_$_CallLogStateEmpty value,
          $Res Function(_$_CallLogStateEmpty) then) =
      __$$_CallLogStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CallLogStateEmptyCopyWithImpl<$Res>
    extends _$CallLogStateCopyWithImpl<$Res, _$_CallLogStateEmpty>
    implements _$$_CallLogStateEmptyCopyWith<$Res> {
  __$$_CallLogStateEmptyCopyWithImpl(
      _$_CallLogStateEmpty _value, $Res Function(_$_CallLogStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CallLogStateEmpty implements _CallLogStateEmpty {
  _$_CallLogStateEmpty();

  @override
  String toString() {
    return 'CallLogState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CallLogStateEmpty);
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
  factory _CallLogStateEmpty() = _$_CallLogStateEmpty;
}

/// @nodoc
abstract class _$$_CallLogStateErrorCopyWith<$Res> {
  factory _$$_CallLogStateErrorCopyWith(_$_CallLogStateError value,
          $Res Function(_$_CallLogStateError) then) =
      __$$_CallLogStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$_CallLogStateErrorCopyWithImpl<$Res>
    extends _$CallLogStateCopyWithImpl<$Res, _$_CallLogStateError>
    implements _$$_CallLogStateErrorCopyWith<$Res> {
  __$$_CallLogStateErrorCopyWithImpl(
      _$_CallLogStateError _value, $Res Function(_$_CallLogStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_CallLogStateError(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_CallLogStateError implements _CallLogStateError {
  _$_CallLogStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CallLogState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallLogStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallLogStateErrorCopyWith<_$_CallLogStateError> get copyWith =>
      __$$_CallLogStateErrorCopyWithImpl<_$_CallLogStateError>(
          this, _$identity);

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
  factory _CallLogStateError(final dynamic error) = _$_CallLogStateError;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_CallLogStateErrorCopyWith<_$_CallLogStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CallLogStateLoadingCopyWith<$Res> {
  factory _$$_CallLogStateLoadingCopyWith(_$_CallLogStateLoading value,
          $Res Function(_$_CallLogStateLoading) then) =
      __$$_CallLogStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemCount});
}

/// @nodoc
class __$$_CallLogStateLoadingCopyWithImpl<$Res>
    extends _$CallLogStateCopyWithImpl<$Res, _$_CallLogStateLoading>
    implements _$$_CallLogStateLoadingCopyWith<$Res> {
  __$$_CallLogStateLoadingCopyWithImpl(_$_CallLogStateLoading _value,
      $Res Function(_$_CallLogStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCount = null,
  }) {
    return _then(_$_CallLogStateLoading(
      null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CallLogStateLoading implements _CallLogStateLoading {
  _$_CallLogStateLoading(this.itemCount);

  @override
  final int itemCount;

  @override
  String toString() {
    return 'CallLogState.loading(itemCount: $itemCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallLogStateLoading &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallLogStateLoadingCopyWith<_$_CallLogStateLoading> get copyWith =>
      __$$_CallLogStateLoadingCopyWithImpl<_$_CallLogStateLoading>(
          this, _$identity);

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
  factory _CallLogStateLoading(final int itemCount) = _$_CallLogStateLoading;

  int get itemCount;
  @JsonKey(ignore: true)
  _$$_CallLogStateLoadingCopyWith<_$_CallLogStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CallLogEvent {
  CallEntry get entry => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CallEntry entry) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CallEntry entry)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CallEntry entry)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CallLogEventEntrySelect value) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CallLogEventEntrySelect value)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CallLogEventEntrySelect value)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallLogEventCopyWith<CallLogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogEventCopyWith<$Res> {
  factory $CallLogEventCopyWith(
          CallLogEvent value, $Res Function(CallLogEvent) then) =
      _$CallLogEventCopyWithImpl<$Res, CallLogEvent>;
  @useResult
  $Res call({CallEntry entry});
}

/// @nodoc
class _$CallLogEventCopyWithImpl<$Res, $Val extends CallLogEvent>
    implements $CallLogEventCopyWith<$Res> {
  _$CallLogEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_value.copyWith(
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as CallEntry,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CallLogEventEntrySelectCopyWith<$Res>
    implements $CallLogEventCopyWith<$Res> {
  factory _$$_CallLogEventEntrySelectCopyWith(_$_CallLogEventEntrySelect value,
          $Res Function(_$_CallLogEventEntrySelect) then) =
      __$$_CallLogEventEntrySelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CallEntry entry});
}

/// @nodoc
class __$$_CallLogEventEntrySelectCopyWithImpl<$Res>
    extends _$CallLogEventCopyWithImpl<$Res, _$_CallLogEventEntrySelect>
    implements _$$_CallLogEventEntrySelectCopyWith<$Res> {
  __$$_CallLogEventEntrySelectCopyWithImpl(_$_CallLogEventEntrySelect _value,
      $Res Function(_$_CallLogEventEntrySelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$_CallLogEventEntrySelect(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as CallEntry,
    ));
  }
}

/// @nodoc

class _$_CallLogEventEntrySelect implements _CallLogEventEntrySelect {
  _$_CallLogEventEntrySelect(this.entry);

  @override
  final CallEntry entry;

  @override
  String toString() {
    return 'CallLogEvent.select(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallLogEventEntrySelect &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallLogEventEntrySelectCopyWith<_$_CallLogEventEntrySelect>
      get copyWith =>
          __$$_CallLogEventEntrySelectCopyWithImpl<_$_CallLogEventEntrySelect>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CallEntry entry) select,
  }) {
    return select(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CallEntry entry)? select,
  }) {
    return select?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CallEntry entry)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CallLogEventEntrySelect value) select,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CallLogEventEntrySelect value)? select,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CallLogEventEntrySelect value)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _CallLogEventEntrySelect implements CallLogEvent {
  factory _CallLogEventEntrySelect(final CallEntry entry) =
      _$_CallLogEventEntrySelect;

  @override
  CallEntry get entry;
  @override
  @JsonKey(ignore: true)
  _$$_CallLogEventEntrySelectCopyWith<_$_CallLogEventEntrySelect>
      get copyWith => throw _privateConstructorUsedError;
}
