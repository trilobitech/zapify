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
mixin _$HistoryViewState {
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
    TResult Function(_HistoryViewStatePopulated value) $default, {
    required TResult Function(_HistoryViewStateLoading value) loading,
    required TResult Function(_HistoryViewStateEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryViewStatePopulated value)? $default, {
    TResult? Function(_HistoryViewStateLoading value)? loading,
    TResult? Function(_HistoryViewStateEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryViewStatePopulated value)? $default, {
    TResult Function(_HistoryViewStateLoading value)? loading,
    TResult Function(_HistoryViewStateEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryViewStateCopyWith<$Res> {
  factory $HistoryViewStateCopyWith(
          HistoryViewState value, $Res Function(HistoryViewState) then) =
      _$HistoryViewStateCopyWithImpl<$Res, HistoryViewState>;
}

/// @nodoc
class _$HistoryViewStateCopyWithImpl<$Res, $Val extends HistoryViewState>
    implements $HistoryViewStateCopyWith<$Res> {
  _$HistoryViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HistoryViewStateLoadingCopyWith<$Res> {
  factory _$$_HistoryViewStateLoadingCopyWith(_$_HistoryViewStateLoading value,
          $Res Function(_$_HistoryViewStateLoading) then) =
      __$$_HistoryViewStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int size});
}

/// @nodoc
class __$$_HistoryViewStateLoadingCopyWithImpl<$Res>
    extends _$HistoryViewStateCopyWithImpl<$Res, _$_HistoryViewStateLoading>
    implements _$$_HistoryViewStateLoadingCopyWith<$Res> {
  __$$_HistoryViewStateLoadingCopyWithImpl(_$_HistoryViewStateLoading _value,
      $Res Function(_$_HistoryViewStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$_HistoryViewStateLoading(
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HistoryViewStateLoading implements _HistoryViewStateLoading {
  _$_HistoryViewStateLoading(this.size);

  @override
  final int size;

  @override
  String toString() {
    return 'HistoryViewState.loading(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryViewStateLoading &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryViewStateLoadingCopyWith<_$_HistoryViewStateLoading>
      get copyWith =>
          __$$_HistoryViewStateLoadingCopyWithImpl<_$_HistoryViewStateLoading>(
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
    TResult Function(_HistoryViewStatePopulated value) $default, {
    required TResult Function(_HistoryViewStateLoading value) loading,
    required TResult Function(_HistoryViewStateEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryViewStatePopulated value)? $default, {
    TResult? Function(_HistoryViewStateLoading value)? loading,
    TResult? Function(_HistoryViewStateEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryViewStatePopulated value)? $default, {
    TResult Function(_HistoryViewStateLoading value)? loading,
    TResult Function(_HistoryViewStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _HistoryViewStateLoading implements HistoryViewState {
  factory _HistoryViewStateLoading(final int size) = _$_HistoryViewStateLoading;

  int get size;
  @JsonKey(ignore: true)
  _$$_HistoryViewStateLoadingCopyWith<_$_HistoryViewStateLoading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HistoryViewStateEmptyCopyWith<$Res> {
  factory _$$_HistoryViewStateEmptyCopyWith(_$_HistoryViewStateEmpty value,
          $Res Function(_$_HistoryViewStateEmpty) then) =
      __$$_HistoryViewStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HistoryViewStateEmptyCopyWithImpl<$Res>
    extends _$HistoryViewStateCopyWithImpl<$Res, _$_HistoryViewStateEmpty>
    implements _$$_HistoryViewStateEmptyCopyWith<$Res> {
  __$$_HistoryViewStateEmptyCopyWithImpl(_$_HistoryViewStateEmpty _value,
      $Res Function(_$_HistoryViewStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_HistoryViewStateEmpty implements _HistoryViewStateEmpty {
  _$_HistoryViewStateEmpty();

  @override
  String toString() {
    return 'HistoryViewState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_HistoryViewStateEmpty);
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
    TResult Function(_HistoryViewStatePopulated value) $default, {
    required TResult Function(_HistoryViewStateLoading value) loading,
    required TResult Function(_HistoryViewStateEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryViewStatePopulated value)? $default, {
    TResult? Function(_HistoryViewStateLoading value)? loading,
    TResult? Function(_HistoryViewStateEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryViewStatePopulated value)? $default, {
    TResult Function(_HistoryViewStateLoading value)? loading,
    TResult Function(_HistoryViewStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _HistoryViewStateEmpty implements HistoryViewState {
  factory _HistoryViewStateEmpty() = _$_HistoryViewStateEmpty;
}

/// @nodoc
abstract class _$$_HistoryViewStatePopulatedCopyWith<$Res> {
  factory _$$_HistoryViewStatePopulatedCopyWith(
          _$_HistoryViewStatePopulated value,
          $Res Function(_$_HistoryViewStatePopulated) then) =
      __$$_HistoryViewStatePopulatedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HistoryEntry> entries});
}

/// @nodoc
class __$$_HistoryViewStatePopulatedCopyWithImpl<$Res>
    extends _$HistoryViewStateCopyWithImpl<$Res, _$_HistoryViewStatePopulated>
    implements _$$_HistoryViewStatePopulatedCopyWith<$Res> {
  __$$_HistoryViewStatePopulatedCopyWithImpl(
      _$_HistoryViewStatePopulated _value,
      $Res Function(_$_HistoryViewStatePopulated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$_HistoryViewStatePopulated(
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
    ));
  }
}

/// @nodoc

class _$_HistoryViewStatePopulated implements _HistoryViewStatePopulated {
  _$_HistoryViewStatePopulated({required final List<HistoryEntry> entries})
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
    return 'HistoryViewState(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryViewStatePopulated &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryViewStatePopulatedCopyWith<_$_HistoryViewStatePopulated>
      get copyWith => __$$_HistoryViewStatePopulatedCopyWithImpl<
          _$_HistoryViewStatePopulated>(this, _$identity);

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
    TResult Function(_HistoryViewStatePopulated value) $default, {
    required TResult Function(_HistoryViewStateLoading value) loading,
    required TResult Function(_HistoryViewStateEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HistoryViewStatePopulated value)? $default, {
    TResult? Function(_HistoryViewStateLoading value)? loading,
    TResult? Function(_HistoryViewStateEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HistoryViewStatePopulated value)? $default, {
    TResult Function(_HistoryViewStateLoading value)? loading,
    TResult Function(_HistoryViewStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _HistoryViewStatePopulated implements HistoryViewState {
  factory _HistoryViewStatePopulated(
          {required final List<HistoryEntry> entries}) =
      _$_HistoryViewStatePopulated;

  List<HistoryEntry> get entries;
  @JsonKey(ignore: true)
  _$$_HistoryViewStatePopulatedCopyWith<_$_HistoryViewStatePopulated>
      get copyWith => throw _privateConstructorUsedError;
}
