// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatAppState {
  Iterable<ChatApp> get enabled => throw _privateConstructorUsedError;
  Iterable<ChatApp> get disabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatAppStateCopyWith<ChatAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatAppStateCopyWith<$Res> {
  factory $ChatAppStateCopyWith(
          ChatAppState value, $Res Function(ChatAppState) then) =
      _$ChatAppStateCopyWithImpl<$Res, ChatAppState>;
  @useResult
  $Res call({Iterable<ChatApp> enabled, Iterable<ChatApp> disabled});
}

/// @nodoc
class _$ChatAppStateCopyWithImpl<$Res, $Val extends ChatAppState>
    implements $ChatAppStateCopyWith<$Res> {
  _$ChatAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? disabled = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatApp>,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatApp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatAppStateCopyWith<$Res>
    implements $ChatAppStateCopyWith<$Res> {
  factory _$$_ChatAppStateCopyWith(
          _$_ChatAppState value, $Res Function(_$_ChatAppState) then) =
      __$$_ChatAppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Iterable<ChatApp> enabled, Iterable<ChatApp> disabled});
}

/// @nodoc
class __$$_ChatAppStateCopyWithImpl<$Res>
    extends _$ChatAppStateCopyWithImpl<$Res, _$_ChatAppState>
    implements _$$_ChatAppStateCopyWith<$Res> {
  __$$_ChatAppStateCopyWithImpl(
      _$_ChatAppState _value, $Res Function(_$_ChatAppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? disabled = null,
  }) {
    return _then(_$_ChatAppState(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatApp>,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatApp>,
    ));
  }
}

/// @nodoc

class _$_ChatAppState implements _ChatAppState {
  _$_ChatAppState({this.enabled = const [], this.disabled = const []});

  @override
  @JsonKey()
  final Iterable<ChatApp> enabled;
  @override
  @JsonKey()
  final Iterable<ChatApp> disabled;

  @override
  String toString() {
    return 'ChatAppState(enabled: $enabled, disabled: $disabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatAppState &&
            const DeepCollectionEquality().equals(other.enabled, enabled) &&
            const DeepCollectionEquality().equals(other.disabled, disabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(enabled),
      const DeepCollectionEquality().hash(disabled));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatAppStateCopyWith<_$_ChatAppState> get copyWith =>
      __$$_ChatAppStateCopyWithImpl<_$_ChatAppState>(this, _$identity);
}

abstract class _ChatAppState implements ChatAppState {
  factory _ChatAppState(
      {final Iterable<ChatApp> enabled,
      final Iterable<ChatApp> disabled}) = _$_ChatAppState;

  @override
  Iterable<ChatApp> get enabled;
  @override
  Iterable<ChatApp> get disabled;
  @override
  @JsonKey(ignore: true)
  _$$_ChatAppStateCopyWith<_$_ChatAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
