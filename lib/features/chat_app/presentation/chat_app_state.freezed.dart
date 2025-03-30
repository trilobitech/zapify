// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatAppState {

 Iterable<ChatApp> get enabled; Iterable<ChatApp> get disabled;
/// Create a copy of ChatAppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatAppStateCopyWith<ChatAppState> get copyWith => _$ChatAppStateCopyWithImpl<ChatAppState>(this as ChatAppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAppState&&const DeepCollectionEquality().equals(other.enabled, enabled)&&const DeepCollectionEquality().equals(other.disabled, disabled));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(enabled),const DeepCollectionEquality().hash(disabled));

@override
String toString() {
  return 'ChatAppState(enabled: $enabled, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class $ChatAppStateCopyWith<$Res>  {
  factory $ChatAppStateCopyWith(ChatAppState value, $Res Function(ChatAppState) _then) = _$ChatAppStateCopyWithImpl;
@useResult
$Res call({
 Iterable<ChatApp> enabled, Iterable<ChatApp> disabled
});




}
/// @nodoc
class _$ChatAppStateCopyWithImpl<$Res>
    implements $ChatAppStateCopyWith<$Res> {
  _$ChatAppStateCopyWithImpl(this._self, this._then);

  final ChatAppState _self;
  final $Res Function(ChatAppState) _then;

/// Create a copy of ChatAppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? disabled = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as Iterable<ChatApp>,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as Iterable<ChatApp>,
  ));
}

}


/// @nodoc


class _ChatAppState implements ChatAppState {
   _ChatAppState({this.enabled = const [], this.disabled = const []});
  

@override@JsonKey() final  Iterable<ChatApp> enabled;
@override@JsonKey() final  Iterable<ChatApp> disabled;

/// Create a copy of ChatAppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatAppStateCopyWith<_ChatAppState> get copyWith => __$ChatAppStateCopyWithImpl<_ChatAppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatAppState&&const DeepCollectionEquality().equals(other.enabled, enabled)&&const DeepCollectionEquality().equals(other.disabled, disabled));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(enabled),const DeepCollectionEquality().hash(disabled));

@override
String toString() {
  return 'ChatAppState(enabled: $enabled, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class _$ChatAppStateCopyWith<$Res> implements $ChatAppStateCopyWith<$Res> {
  factory _$ChatAppStateCopyWith(_ChatAppState value, $Res Function(_ChatAppState) _then) = __$ChatAppStateCopyWithImpl;
@override @useResult
$Res call({
 Iterable<ChatApp> enabled, Iterable<ChatApp> disabled
});




}
/// @nodoc
class __$ChatAppStateCopyWithImpl<$Res>
    implements _$ChatAppStateCopyWith<$Res> {
  __$ChatAppStateCopyWithImpl(this._self, this._then);

  final _ChatAppState _self;
  final $Res Function(_ChatAppState) _then;

/// Create a copy of ChatAppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? disabled = null,}) {
  return _then(_ChatAppState(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as Iterable<ChatApp>,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as Iterable<ChatApp>,
  ));
}


}

// dart format on
