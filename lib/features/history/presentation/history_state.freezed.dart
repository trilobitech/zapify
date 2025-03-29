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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value) $default, {
    required TResult Function(_HistoryStateLoading value) loading,
    required TResult Function(_HistoryStateEmpty value) empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryStatePopulated value)? $default, {
    TResult? Function(_HistoryStateLoading value)? loading,
    TResult? Function(_HistoryStateEmpty value)? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryStatePopulated value)? $default, {
    TResult Function(_HistoryStateLoading value)? loading,
    TResult Function(_HistoryStateEmpty value)? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HistoryStateLoadingImplCopyWith<$Res> {
  factory _$$HistoryStateLoadingImplCopyWith(
    _$HistoryStateLoadingImpl value,
    $Res Function(_$HistoryStateLoadingImpl) then,
  ) = __$$HistoryStateLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int size});
}

/// @nodoc
class __$$HistoryStateLoadingImplCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateLoadingImpl>
    implements _$$HistoryStateLoadingImplCopyWith<$Res> {
  __$$HistoryStateLoadingImplCopyWithImpl(
    _$HistoryStateLoadingImpl _value,
    $Res Function(_$HistoryStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? size = null}) {
    return _then(
      _$HistoryStateLoadingImpl(
        null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$HistoryStateLoadingImpl implements _HistoryStateLoading {
  _$HistoryStateLoadingImpl(this.size);

  @override
  final int size;

  @override
  String toString() {
    return 'HistoryState.loading(size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateLoadingImpl &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateLoadingImplCopyWith<_$HistoryStateLoadingImpl> get copyWith =>
      __$$HistoryStateLoadingImplCopyWithImpl<_$HistoryStateLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return loading(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return loading?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
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
  factory _HistoryStateLoading(final int size) = _$HistoryStateLoadingImpl;

  int get size;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateLoadingImplCopyWith<_$HistoryStateLoadingImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryStateEmptyImplCopyWith<$Res> {
  factory _$$HistoryStateEmptyImplCopyWith(_$HistoryStateEmptyImpl value, $Res Function(_$HistoryStateEmptyImpl) then) =
      __$$HistoryStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateEmptyImplCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateEmptyImpl>
    implements _$$HistoryStateEmptyImplCopyWith<$Res> {
  __$$HistoryStateEmptyImplCopyWithImpl(_$HistoryStateEmptyImpl _value, $Res Function(_$HistoryStateEmptyImpl) _then)
    : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoryStateEmptyImpl implements _HistoryStateEmpty {
  _$HistoryStateEmptyImpl();

  @override
  String toString() {
    return 'HistoryState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$HistoryStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
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
  factory _HistoryStateEmpty() = _$HistoryStateEmptyImpl;
}

/// @nodoc
abstract class _$$HistoryStatePopulatedImplCopyWith<$Res> {
  factory _$$HistoryStatePopulatedImplCopyWith(
    _$HistoryStatePopulatedImpl value,
    $Res Function(_$HistoryStatePopulatedImpl) then,
  ) = __$$HistoryStatePopulatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HistoryEntry> entries, bool isDismissable});
}

/// @nodoc
class __$$HistoryStatePopulatedImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStatePopulatedImpl>
    implements _$$HistoryStatePopulatedImplCopyWith<$Res> {
  __$$HistoryStatePopulatedImplCopyWithImpl(
    _$HistoryStatePopulatedImpl _value,
    $Res Function(_$HistoryStatePopulatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entries = null, Object? isDismissable = null}) {
    return _then(
      _$HistoryStatePopulatedImpl(
        entries:
            null == entries
                ? _value._entries
                : entries // ignore: cast_nullable_to_non_nullable
                    as List<HistoryEntry>,
        isDismissable:
            null == isDismissable
                ? _value.isDismissable
                : isDismissable // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$HistoryStatePopulatedImpl implements _HistoryStatePopulated {
  _$HistoryStatePopulatedImpl({required final List<HistoryEntry> entries, this.isDismissable = false})
    : _entries = entries;

  final List<HistoryEntry> _entries;
  @override
  List<HistoryEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  @JsonKey()
  final bool isDismissable;

  @override
  String toString() {
    return 'HistoryState(entries: $entries, isDismissable: $isDismissable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStatePopulatedImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.isDismissable, isDismissable) || other.isDismissable == isDismissable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries), isDismissable);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStatePopulatedImplCopyWith<_$HistoryStatePopulatedImpl> get copyWith =>
      __$$HistoryStatePopulatedImplCopyWithImpl<_$HistoryStatePopulatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable) $default, {
    required TResult Function(int size) loading,
    required TResult Function() empty,
  }) {
    return $default(entries, isDismissable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult? Function(int size)? loading,
    TResult? Function()? empty,
  }) {
    return $default?.call(entries, isDismissable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<HistoryEntry> entries, bool isDismissable)? $default, {
    TResult Function(int size)? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(entries, isDismissable);
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
  factory _HistoryStatePopulated({required final List<HistoryEntry> entries, final bool isDismissable}) =
      _$HistoryStatePopulatedImpl;

  List<HistoryEntry> get entries;
  bool get isDismissable;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStatePopulatedImplCopyWith<_$HistoryStatePopulatedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryAction {
  HistoryEntry get entry => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) showMenu,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult Function(HistoryEntry entry)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryActionEntrySelect value) select,
    required TResult Function(_HistoryActionShowMenu value) showMenu,
    required TResult Function(_HistoryActionEntryRemoved value) showRestoreEntrySnackBar,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionShowMenu value)? showMenu,
    TResult? Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionShowMenu value)? showMenu,
    TResult Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryActionCopyWith<HistoryAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryActionCopyWith<$Res> {
  factory $HistoryActionCopyWith(HistoryAction value, $Res Function(HistoryAction) then) =
      _$HistoryActionCopyWithImpl<$Res, HistoryAction>;
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class _$HistoryActionCopyWithImpl<$Res, $Val extends HistoryAction> implements $HistoryActionCopyWith<$Res> {
  _$HistoryActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryAction
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
                        as HistoryEntry,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryActionEntrySelectImplCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory _$$HistoryActionEntrySelectImplCopyWith(
    _$HistoryActionEntrySelectImpl value,
    $Res Function(_$HistoryActionEntrySelectImpl) then,
  ) = __$$HistoryActionEntrySelectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class __$$HistoryActionEntrySelectImplCopyWithImpl<$Res>
    extends _$HistoryActionCopyWithImpl<$Res, _$HistoryActionEntrySelectImpl>
    implements _$$HistoryActionEntrySelectImplCopyWith<$Res> {
  __$$HistoryActionEntrySelectImplCopyWithImpl(
    _$HistoryActionEntrySelectImpl _value,
    $Res Function(_$HistoryActionEntrySelectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _$HistoryActionEntrySelectImpl(
        null == entry
            ? _value.entry
            : entry // ignore: cast_nullable_to_non_nullable
                as HistoryEntry,
      ),
    );
  }
}

/// @nodoc

class _$HistoryActionEntrySelectImpl implements _HistoryActionEntrySelect {
  _$HistoryActionEntrySelectImpl(this.entry);

  @override
  final HistoryEntry entry;

  @override
  String toString() {
    return 'HistoryAction.select(entry: $entry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryActionEntrySelectImpl &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryActionEntrySelectImplCopyWith<_$HistoryActionEntrySelectImpl> get copyWith =>
      __$$HistoryActionEntrySelectImplCopyWithImpl<_$HistoryActionEntrySelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) showMenu,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) {
    return select(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) {
    return select?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
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
    required TResult Function(_HistoryActionShowMenu value) showMenu,
    required TResult Function(_HistoryActionEntryRemoved value) showRestoreEntrySnackBar,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionShowMenu value)? showMenu,
    TResult? Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionShowMenu value)? showMenu,
    TResult Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _HistoryActionEntrySelect implements HistoryAction {
  factory _HistoryActionEntrySelect(final HistoryEntry entry) = _$HistoryActionEntrySelectImpl;

  @override
  HistoryEntry get entry;

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryActionEntrySelectImplCopyWith<_$HistoryActionEntrySelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryActionShowMenuImplCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory _$$HistoryActionShowMenuImplCopyWith(
    _$HistoryActionShowMenuImpl value,
    $Res Function(_$HistoryActionShowMenuImpl) then,
  ) = __$$HistoryActionShowMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options});
}

/// @nodoc
class __$$HistoryActionShowMenuImplCopyWithImpl<$Res>
    extends _$HistoryActionCopyWithImpl<$Res, _$HistoryActionShowMenuImpl>
    implements _$$HistoryActionShowMenuImplCopyWith<$Res> {
  __$$HistoryActionShowMenuImplCopyWithImpl(
    _$HistoryActionShowMenuImpl _value,
    $Res Function(_$HistoryActionShowMenuImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null, Object? position = null, Object? options = null}) {
    return _then(
      _$HistoryActionShowMenuImpl(
        null == entry
            ? _value.entry
            : entry // ignore: cast_nullable_to_non_nullable
                as HistoryEntry,
        null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                as Offset,
        null == options
            ? _value.options
            : options // ignore: cast_nullable_to_non_nullable
                as Iterable<ContextMenuAction>,
      ),
    );
  }
}

/// @nodoc

class _$HistoryActionShowMenuImpl implements _HistoryActionShowMenu {
  _$HistoryActionShowMenuImpl(this.entry, this.position, this.options);

  @override
  final HistoryEntry entry;
  @override
  final Offset position;
  @override
  final Iterable<ContextMenuAction> options;

  @override
  String toString() {
    return 'HistoryAction.showMenu(entry: $entry, position: $position, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryActionShowMenuImpl &&
            (identical(other.entry, entry) || other.entry == entry) &&
            (identical(other.position, position) || other.position == position) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry, position, const DeepCollectionEquality().hash(options));

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryActionShowMenuImplCopyWith<_$HistoryActionShowMenuImpl> get copyWith =>
      __$$HistoryActionShowMenuImplCopyWithImpl<_$HistoryActionShowMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) showMenu,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) {
    return showMenu(entry, position, options);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) {
    return showMenu?.call(entry, position, options);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult Function(HistoryEntry entry)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (showMenu != null) {
      return showMenu(entry, position, options);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryActionEntrySelect value) select,
    required TResult Function(_HistoryActionShowMenu value) showMenu,
    required TResult Function(_HistoryActionEntryRemoved value) showRestoreEntrySnackBar,
  }) {
    return showMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionShowMenu value)? showMenu,
    TResult? Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
  }) {
    return showMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionShowMenu value)? showMenu,
    TResult Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (showMenu != null) {
      return showMenu(this);
    }
    return orElse();
  }
}

abstract class _HistoryActionShowMenu implements HistoryAction {
  factory _HistoryActionShowMenu(
    final HistoryEntry entry,
    final Offset position,
    final Iterable<ContextMenuAction> options,
  ) = _$HistoryActionShowMenuImpl;

  @override
  HistoryEntry get entry;
  Offset get position;
  Iterable<ContextMenuAction> get options;

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryActionShowMenuImplCopyWith<_$HistoryActionShowMenuImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryActionEntryRemovedImplCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory _$$HistoryActionEntryRemovedImplCopyWith(
    _$HistoryActionEntryRemovedImpl value,
    $Res Function(_$HistoryActionEntryRemovedImpl) then,
  ) = __$$HistoryActionEntryRemovedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HistoryEntry entry});
}

/// @nodoc
class __$$HistoryActionEntryRemovedImplCopyWithImpl<$Res>
    extends _$HistoryActionCopyWithImpl<$Res, _$HistoryActionEntryRemovedImpl>
    implements _$$HistoryActionEntryRemovedImplCopyWith<$Res> {
  __$$HistoryActionEntryRemovedImplCopyWithImpl(
    _$HistoryActionEntryRemovedImpl _value,
    $Res Function(_$HistoryActionEntryRemovedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _$HistoryActionEntryRemovedImpl(
        null == entry
            ? _value.entry
            : entry // ignore: cast_nullable_to_non_nullable
                as HistoryEntry,
      ),
    );
  }
}

/// @nodoc

class _$HistoryActionEntryRemovedImpl implements _HistoryActionEntryRemoved {
  _$HistoryActionEntryRemovedImpl(this.entry);

  @override
  final HistoryEntry entry;

  @override
  String toString() {
    return 'HistoryAction.showRestoreEntrySnackBar(entry: $entry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryActionEntryRemovedImpl &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryActionEntryRemovedImplCopyWith<_$HistoryActionEntryRemovedImpl> get copyWith =>
      __$$HistoryActionEntryRemovedImplCopyWithImpl<_$HistoryActionEntryRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HistoryEntry entry) select,
    required TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options) showMenu,
    required TResult Function(HistoryEntry entry) showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HistoryEntry entry)? select,
    TResult? Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
    TResult? Function(HistoryEntry entry)? showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HistoryEntry entry)? select,
    TResult Function(HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options)? showMenu,
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
    required TResult Function(_HistoryActionShowMenu value) showMenu,
    required TResult Function(_HistoryActionEntryRemoved value) showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryActionEntrySelect value)? select,
    TResult? Function(_HistoryActionShowMenu value)? showMenu,
    TResult? Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
  }) {
    return showRestoreEntrySnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryActionEntrySelect value)? select,
    TResult Function(_HistoryActionShowMenu value)? showMenu,
    TResult Function(_HistoryActionEntryRemoved value)? showRestoreEntrySnackBar,
    required TResult orElse(),
  }) {
    if (showRestoreEntrySnackBar != null) {
      return showRestoreEntrySnackBar(this);
    }
    return orElse();
  }
}

abstract class _HistoryActionEntryRemoved implements HistoryAction {
  factory _HistoryActionEntryRemoved(final HistoryEntry entry) = _$HistoryActionEntryRemovedImpl;

  @override
  HistoryEntry get entry;

  /// Create a copy of HistoryAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryActionEntryRemovedImplCopyWith<_$HistoryActionEntryRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
