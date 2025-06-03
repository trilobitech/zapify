// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_apps_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatAppsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAppsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatAppsState()';
}


}

/// @nodoc
class $ChatAppsStateCopyWith<$Res>  {
$ChatAppsStateCopyWith(ChatAppsState _, $Res Function(ChatAppsState) __);
}


/// @nodoc


class InitialChatAppsState implements ChatAppsState {
   InitialChatAppsState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialChatAppsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatAppsState.initial()';
}


}




/// @nodoc


class LoadedChatAppsState implements ChatAppsState {
   LoadedChatAppsState(this.entries);
  

 final  Iterable<ChatApp> entries;

/// Create a copy of ChatAppsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedChatAppsStateCopyWith<LoadedChatAppsState> get copyWith => _$LoadedChatAppsStateCopyWithImpl<LoadedChatAppsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedChatAppsState&&const DeepCollectionEquality().equals(other.entries, entries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'ChatAppsState(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $LoadedChatAppsStateCopyWith<$Res> implements $ChatAppsStateCopyWith<$Res> {
  factory $LoadedChatAppsStateCopyWith(LoadedChatAppsState value, $Res Function(LoadedChatAppsState) _then) = _$LoadedChatAppsStateCopyWithImpl;
@useResult
$Res call({
 Iterable<ChatApp> entries
});




}
/// @nodoc
class _$LoadedChatAppsStateCopyWithImpl<$Res>
    implements $LoadedChatAppsStateCopyWith<$Res> {
  _$LoadedChatAppsStateCopyWithImpl(this._self, this._then);

  final LoadedChatAppsState _self;
  final $Res Function(LoadedChatAppsState) _then;

/// Create a copy of ChatAppsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(LoadedChatAppsState(
null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as Iterable<ChatApp>,
  ));
}


}

/// @nodoc
mixin _$ChatAppsAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAppsAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatAppsAction()';
}


}

/// @nodoc
class $ChatAppsActionCopyWith<$Res>  {
$ChatAppsActionCopyWith(ChatAppsAction _, $Res Function(ChatAppsAction) __);
}


/// @nodoc


class SelectEntryChatAppsAction implements ChatAppsAction {
   SelectEntryChatAppsAction(this.entry, this.phoneNumber);
  

 final  ChatApp entry;
 final  PhoneNumberValue? phoneNumber;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectEntryChatAppsActionCopyWith<SelectEntryChatAppsAction> get copyWith => _$SelectEntryChatAppsActionCopyWithImpl<SelectEntryChatAppsAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectEntryChatAppsAction&&(identical(other.entry, entry) || other.entry == entry)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,entry,phoneNumber);

@override
String toString() {
  return 'ChatAppsAction.select(entry: $entry, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $SelectEntryChatAppsActionCopyWith<$Res> implements $ChatAppsActionCopyWith<$Res> {
  factory $SelectEntryChatAppsActionCopyWith(SelectEntryChatAppsAction value, $Res Function(SelectEntryChatAppsAction) _then) = _$SelectEntryChatAppsActionCopyWithImpl;
@useResult
$Res call({
 ChatApp entry, PhoneNumberValue? phoneNumber
});




}
/// @nodoc
class _$SelectEntryChatAppsActionCopyWithImpl<$Res>
    implements $SelectEntryChatAppsActionCopyWith<$Res> {
  _$SelectEntryChatAppsActionCopyWithImpl(this._self, this._then);

  final SelectEntryChatAppsAction _self;
  final $Res Function(SelectEntryChatAppsAction) _then;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,Object? phoneNumber = freezed,}) {
  return _then(SelectEntryChatAppsAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as ChatApp,freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneNumberValue?,
  ));
}


}

/// @nodoc


class ShowFailureMessageChatAppsAction implements ChatAppsAction {
   ShowFailureMessageChatAppsAction(this.app);
  

 final  ChatApp app;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowFailureMessageChatAppsActionCopyWith<ShowFailureMessageChatAppsAction> get copyWith => _$ShowFailureMessageChatAppsActionCopyWithImpl<ShowFailureMessageChatAppsAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowFailureMessageChatAppsAction&&(identical(other.app, app) || other.app == app));
}


@override
int get hashCode => Object.hash(runtimeType,app);

@override
String toString() {
  return 'ChatAppsAction.showFailureMessage(app: $app)';
}


}

/// @nodoc
abstract mixin class $ShowFailureMessageChatAppsActionCopyWith<$Res> implements $ChatAppsActionCopyWith<$Res> {
  factory $ShowFailureMessageChatAppsActionCopyWith(ShowFailureMessageChatAppsAction value, $Res Function(ShowFailureMessageChatAppsAction) _then) = _$ShowFailureMessageChatAppsActionCopyWithImpl;
@useResult
$Res call({
 ChatApp app
});




}
/// @nodoc
class _$ShowFailureMessageChatAppsActionCopyWithImpl<$Res>
    implements $ShowFailureMessageChatAppsActionCopyWith<$Res> {
  _$ShowFailureMessageChatAppsActionCopyWithImpl(this._self, this._then);

  final ShowFailureMessageChatAppsAction _self;
  final $Res Function(ShowFailureMessageChatAppsAction) _then;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? app = null,}) {
  return _then(ShowFailureMessageChatAppsAction(
null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as ChatApp,
  ));
}


}

/// @nodoc


class ShowInvalidPhoneNumberErrorChatAppsAction implements ChatAppsAction {
   ShowInvalidPhoneNumberErrorChatAppsAction(this.app, this.phoneNumber);
  

 final  ChatApp app;
 final  PhoneNumberValue phoneNumber;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowInvalidPhoneNumberErrorChatAppsActionCopyWith<ShowInvalidPhoneNumberErrorChatAppsAction> get copyWith => _$ShowInvalidPhoneNumberErrorChatAppsActionCopyWithImpl<ShowInvalidPhoneNumberErrorChatAppsAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowInvalidPhoneNumberErrorChatAppsAction&&(identical(other.app, app) || other.app == app)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,app,phoneNumber);

@override
String toString() {
  return 'ChatAppsAction.showInvalidPhoneNumberError(app: $app, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $ShowInvalidPhoneNumberErrorChatAppsActionCopyWith<$Res> implements $ChatAppsActionCopyWith<$Res> {
  factory $ShowInvalidPhoneNumberErrorChatAppsActionCopyWith(ShowInvalidPhoneNumberErrorChatAppsAction value, $Res Function(ShowInvalidPhoneNumberErrorChatAppsAction) _then) = _$ShowInvalidPhoneNumberErrorChatAppsActionCopyWithImpl;
@useResult
$Res call({
 ChatApp app, PhoneNumberValue phoneNumber
});




}
/// @nodoc
class _$ShowInvalidPhoneNumberErrorChatAppsActionCopyWithImpl<$Res>
    implements $ShowInvalidPhoneNumberErrorChatAppsActionCopyWith<$Res> {
  _$ShowInvalidPhoneNumberErrorChatAppsActionCopyWithImpl(this._self, this._then);

  final ShowInvalidPhoneNumberErrorChatAppsAction _self;
  final $Res Function(ShowInvalidPhoneNumberErrorChatAppsAction) _then;

/// Create a copy of ChatAppsAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? app = null,Object? phoneNumber = null,}) {
  return _then(ShowInvalidPhoneNumberErrorChatAppsAction(
null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as ChatApp,null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneNumberValue,
  ));
}


}

// dart format on
