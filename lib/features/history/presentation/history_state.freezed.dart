// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value) $default, {
    required TResult Function(_HistoryStateLoading value) loading,
    required TResult Function(_HistoryStateEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryStatePopulated value)? $default, {
    TResult? Function(_HistoryStateLoading value)? loading,
    TResult? Function(_HistoryStateEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value)? $default, {
    TResult Function(_HistoryStateLoading value)? loading,
    TResult Function(_HistoryStateEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HistoryStateLoadingCopyWith<$Res> {
  factory _$$_HistoryStateLoadingCopyWith(_$_HistoryStateLoading value,
          $Res Function(_$_HistoryStateLoading) then) =
      __$$_HistoryStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int size});
}

/// @nodoc
class __$$_HistoryStateLoadingCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$_HistoryStateLoading>
    implements _$$_HistoryStateLoadingCopyWith<$Res> {
  __$$_HistoryStateLoadingCopyWithImpl(_$_HistoryStateLoading _value,
      $Res Function(_$_HistoryStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$_HistoryStateLoading(
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HistoryStateLoading implements _HistoryStateLoading {
  _$_HistoryStateLoading(this.size);

  @override
  final int size;

  @override
  String toString() {
    return 'HistoryState.loading(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryStateLoading &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryStateLoadingCopyWith<_$_HistoryStateLoading> get copyWith =>
      __$$_HistoryStateLoadingCopyWithImpl<_$_HistoryStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return loading(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return loading?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value) $default, {
    required TResult Function(_HistoryStateLoading value) loading,
    required TResult Function(_HistoryStateEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryStatePopulated value)? $default, {
    TResult? Function(_HistoryStateLoading value)? loading,
    TResult? Function(_HistoryStateEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value)? $default, {
    TResult Function(_HistoryStateLoading value)? loading,
    TResult Function(_HistoryStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _HistoryStateLoading implements HistoryState {
  factory _HistoryStateLoading(final int size) = _$_HistoryStateLoading;

  int get size;
  @JsonKey(ignore: true)
  _$$_HistoryStateLoadingCopyWith<_$_HistoryStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HistoryStateEmptyCopyWith<$Res> {
  factory _$$_HistoryStateEmptyCopyWith(_$_HistoryStateEmpty value,
          $Res Function(_$_HistoryStateEmpty) then) =
      __$$_HistoryStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HistoryStateEmptyCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$_HistoryStateEmpty>
    implements _$$_HistoryStateEmptyCopyWith<$Res> {
  __$$_HistoryStateEmptyCopyWithImpl(
      _$_HistoryStateEmpty _value, $Res Function(_$_HistoryStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_HistoryStateEmpty implements _HistoryStateEmpty {
  _$_HistoryStateEmpty();

  @override
  String toString() {
    return 'HistoryState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_HistoryStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
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
    TResult Function(_HistoryStatePopulated value) $default, {
    required TResult Function(_HistoryStateLoading value) loading,
    required TResult Function(_HistoryStateEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryStatePopulated value)? $default, {
    TResult? Function(_HistoryStateLoading value)? loading,
    TResult? Function(_HistoryStateEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value)? $default, {
    TResult Function(_HistoryStateLoading value)? loading,
    TResult Function(_HistoryStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _HistoryStateEmpty implements HistoryState {
  factory _HistoryStateEmpty() = _$_HistoryStateEmpty;
}

/// @nodoc
abstract class _$$_HistoryStatePopulatedCopyWith<$Res> {
  factory _$$_HistoryStatePopulatedCopyWith(_$_HistoryStatePopulated value,
          $Res Function(_$_HistoryStatePopulated) then) =
      __$$_HistoryStatePopulatedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HistoryEntry> entries});
}

/// @nodoc
class __$$_HistoryStatePopulatedCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$_HistoryStatePopulated>
    implements _$$_HistoryStatePopulatedCopyWith<$Res> {
  __$$_HistoryStatePopulatedCopyWithImpl(_$_HistoryStatePopulated _value,
      $Res Function(_$_HistoryStatePopulated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$_HistoryStatePopulated(
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
    ));
  }
}

/// @nodoc

class _$_HistoryStatePopulated implements _HistoryStatePopulated {
  _$_HistoryStatePopulated({required final List<HistoryEntry> entries})
      : _entries = entries;

  final List<HistoryEntry> _entries;
  @override
  List<HistoryEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'HistoryState(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryStatePopulated &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryStatePopulatedCopyWith<_$_HistoryStatePopulated> get copyWith =>
      __$$_HistoryStatePopulatedCopyWithImpl<_$_HistoryStatePopulated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return $default(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return $default?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
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
    TResult Function(_HistoryStatePopulated value) $default, {
    required TResult Function(_HistoryStateLoading value) loading,
    required TResult Function(_HistoryStateEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryStatePopulated value)? $default, {
    TResult? Function(_HistoryStateLoading value)? loading,
    TResult? Function(_HistoryStateEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value)? $default, {
    TResult Function(_HistoryStateLoading value)? loading,
    TResult Function(_HistoryStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _HistoryStatePopulated implements HistoryState {
  factory _HistoryStatePopulated({required final List<HistoryEntry> entries}) =
      _$_HistoryStatePopulated;

  List<HistoryEntry> get entries;
  @JsonKey(ignore: true)
  _$$_HistoryStatePopulatedCopyWith<_$_HistoryStatePopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryAction {
  HistoryEntry get entry => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryActionEntrySelect value) select,
    required TResult Function(_HistoryActionEntryRemoved value)
        showRestoreEntrySnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryActionCopyWith<HistoryAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryActionCopyWith<$Res> {
  factory $HistoryActionCopyWith(
          HistoryAction value, $Res Function(HistoryAction) then) =
      _$HistoryActionCopyWithImpl<$Res, HistoryAction>;
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class _$HistoryActionCopyWithImpl<$Res, $Val extends HistoryAction>
    implements $HistoryActionCopyWith<$Res> {
  _$HistoryActionCopyWithImpl(this._value, this._then);

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
              as HistoryEntry,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryActionEntrySelectCopyWith<$Res>
    implements $HistoryActionCopyWith<$Res> {
  factory _$$_HistoryActionEntrySelectCopyWith(
          _$_HistoryActionEntrySelect value,
          $Res Function(_$_HistoryActionEntrySelect) then) =
      __$$_HistoryActionEntrySelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class __$$_HistoryActionEntrySelectCopyWithImpl<$Res>
    extends _$HistoryActionCopyWithImpl<$Res, _$_HistoryActionEntrySelect>
    implements _$$_HistoryActionEntrySelectCopyWith<$Res> {
  __$$_HistoryActionEntrySelectCopyWithImpl(_$_HistoryActionEntrySelect _value,
      $Res Function(_$_HistoryActionEntrySelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$_HistoryActionEntrySelect(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as HistoryEntry,
    ));
  }
}

/// @nodoc

class _$_HistoryActionEntrySelect implements _HistoryActionEntrySelect {
  _$_HistoryActionEntrySelect(this.entry);

  @override
  final HistoryEntry entry;

  @override
  String toString() {
    return 'HistoryAction.select(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryActionEntrySelect &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryActionEntrySelectCopyWith<_$_HistoryActionEntrySelect>
      get copyWith => __$$_HistoryActionEntrySelectCopyWithImpl<
          _$_HistoryActionEntrySelect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) {
    return select(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) {
    return select?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry)? showRestoreEntrySnackBar,
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
    required TResult Function(_HistoryActionEntrySelect value) select,
    required TResult Function(_HistoryActionEntryRemoved value)
        showRestoreEntrySnackBar,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _HistoryActionEntrySelect implements HistoryAction {
  factory _HistoryActionEntrySelect(final HistoryEntry entry) =
      _$_HistoryActionEntrySelect;

  @override
  HistoryEntry get entry;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryActionEntrySelectCopyWith<_$_HistoryActionEntrySelect>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HistoryActionEntryRemovedCopyWith<$Res>
    implements $HistoryActionCopyWith<$Res> {
  factory _$$_HistoryActionEntryRemovedCopyWith(
          _$_HistoryActionEntryRemoved value,
          $Res Function(_$_HistoryActionEntryRemoved) then) =
      __$$_HistoryActionEntryRemovedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class __$$_HistoryActionEntryRemovedCopyWithImpl<$Res>
    extends _$HistoryActionCopyWithImpl<$Res, _$_HistoryActionEntryRemoved>
    implements _$$_HistoryActionEntryRemovedCopyWith<$Res> {
  __$$_HistoryActionEntryRemovedCopyWithImpl(
      _$_HistoryActionEntryRemoved _value,
      $Res Function(_$_HistoryActionEntryRemoved) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$_HistoryActionEntryRemoved(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as HistoryEntry,
    ));
  }
}

/// @nodoc

class _$_HistoryActionEntryRemoved implements _HistoryActionEntryRemoved {
  _$_HistoryActionEntryRemoved(this.entry);

  @override
  final HistoryEntry entry;

  @override
  String toString() {
    return 'HistoryAction.showRestoreEntrySnackBar(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryActionEntryRemoved &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryActionEntryRemovedCopyWith<_$_HistoryActionEntryRemoved>
      get copyWith => __$$_HistoryActionEntryRemovedCopyWithImpl<
          _$_HistoryActionEntryRemoved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (showRestoreEntrySnackBar != null) {
      return showRestoreEntrySnackBar(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryActionEntrySelect value) select,
    required TResult Function(_HistoryActionEntryRemoved value)
        showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionEntryRemoved value)?
        showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (showRestoreEntrySnackBar != null) {
      return showRestoreEntrySnackBar(this);
    }
    return orElse();
  }
}

abstract class _HistoryActionEntryRemoved implements HistoryAction {
  factory _HistoryActionEntryRemoved(final HistoryEntry entry) =
      _$_HistoryActionEntryRemoved;

  @override
  HistoryEntry get entry;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryActionEntryRemovedCopyWith<_$_HistoryActionEntryRemoved>
      get copyWith => throw _privateConstructorUsedError;
}
