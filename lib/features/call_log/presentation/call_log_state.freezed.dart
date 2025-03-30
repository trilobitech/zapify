// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CallLogState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallLogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallLogState()';
}


}

/// @nodoc
class $CallLogStateCopyWith<$Res>  {
$CallLogStateCopyWith(CallLogState _, $Res Function(CallLogState) __);
}


/// @nodoc


class LoadedCallLogState implements CallLogState {
   LoadedCallLogState({required this.entries});
  

 final  Iterable<CallEntry> entries;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCallLogStateCopyWith<LoadedCallLogState> get copyWith => _$LoadedCallLogStateCopyWithImpl<LoadedCallLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedCallLogState&&const DeepCollectionEquality().equals(other.entries, entries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'CallLogState(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $LoadedCallLogStateCopyWith<$Res> implements $CallLogStateCopyWith<$Res> {
  factory $LoadedCallLogStateCopyWith(LoadedCallLogState value, $Res Function(LoadedCallLogState) _then) = _$LoadedCallLogStateCopyWithImpl;
@useResult
$Res call({
 Iterable<CallEntry> entries
});




}
/// @nodoc
class _$LoadedCallLogStateCopyWithImpl<$Res>
    implements $LoadedCallLogStateCopyWith<$Res> {
  _$LoadedCallLogStateCopyWithImpl(this._self, this._then);

  final LoadedCallLogState _self;
  final $Res Function(LoadedCallLogState) _then;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(LoadedCallLogState(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as Iterable<CallEntry>,
  ));
}


}

/// @nodoc


class EmptyCallLogState implements CallLogState {
   EmptyCallLogState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyCallLogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallLogState.empty()';
}


}




/// @nodoc


class ErrorCallLogState implements CallLogState {
   ErrorCallLogState(this.error);
  

 final  dynamic error;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCallLogStateCopyWith<ErrorCallLogState> get copyWith => _$ErrorCallLogStateCopyWithImpl<ErrorCallLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCallLogState&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'CallLogState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCallLogStateCopyWith<$Res> implements $CallLogStateCopyWith<$Res> {
  factory $ErrorCallLogStateCopyWith(ErrorCallLogState value, $Res Function(ErrorCallLogState) _then) = _$ErrorCallLogStateCopyWithImpl;
@useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ErrorCallLogStateCopyWithImpl<$Res>
    implements $ErrorCallLogStateCopyWith<$Res> {
  _$ErrorCallLogStateCopyWithImpl(this._self, this._then);

  final ErrorCallLogState _self;
  final $Res Function(ErrorCallLogState) _then;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ErrorCallLogState(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class LoadingCallLogState implements CallLogState {
   LoadingCallLogState(this.itemCount);
  

 final  int itemCount;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCallLogStateCopyWith<LoadingCallLogState> get copyWith => _$LoadingCallLogStateCopyWithImpl<LoadingCallLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCallLogState&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}


@override
int get hashCode => Object.hash(runtimeType,itemCount);

@override
String toString() {
  return 'CallLogState.loading(itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class $LoadingCallLogStateCopyWith<$Res> implements $CallLogStateCopyWith<$Res> {
  factory $LoadingCallLogStateCopyWith(LoadingCallLogState value, $Res Function(LoadingCallLogState) _then) = _$LoadingCallLogStateCopyWithImpl;
@useResult
$Res call({
 int itemCount
});




}
/// @nodoc
class _$LoadingCallLogStateCopyWithImpl<$Res>
    implements $LoadingCallLogStateCopyWith<$Res> {
  _$LoadingCallLogStateCopyWithImpl(this._self, this._then);

  final LoadingCallLogState _self;
  final $Res Function(LoadingCallLogState) _then;

/// Create a copy of CallLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemCount = null,}) {
  return _then(LoadingCallLogState(
null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CallLogAction {

 CallEntry get entry;
/// Create a copy of CallLogAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallLogActionCopyWith<CallLogAction> get copyWith => _$CallLogActionCopyWithImpl<CallLogAction>(this as CallLogAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallLogAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'CallLogAction(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $CallLogActionCopyWith<$Res>  {
  factory $CallLogActionCopyWith(CallLogAction value, $Res Function(CallLogAction) _then) = _$CallLogActionCopyWithImpl;
@useResult
$Res call({
 CallEntry entry
});




}
/// @nodoc
class _$CallLogActionCopyWithImpl<$Res>
    implements $CallLogActionCopyWith<$Res> {
  _$CallLogActionCopyWithImpl(this._self, this._then);

  final CallLogAction _self;
  final $Res Function(CallLogAction) _then;

/// Create a copy of CallLogAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entry = null,}) {
  return _then(_self.copyWith(
entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as CallEntry,
  ));
}

}


/// @nodoc


class SelectEntryCallLogAction implements CallLogAction {
   SelectEntryCallLogAction(this.entry);
  

@override final  CallEntry entry;

/// Create a copy of CallLogAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectEntryCallLogActionCopyWith<SelectEntryCallLogAction> get copyWith => _$SelectEntryCallLogActionCopyWithImpl<SelectEntryCallLogAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectEntryCallLogAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'CallLogAction.select(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $SelectEntryCallLogActionCopyWith<$Res> implements $CallLogActionCopyWith<$Res> {
  factory $SelectEntryCallLogActionCopyWith(SelectEntryCallLogAction value, $Res Function(SelectEntryCallLogAction) _then) = _$SelectEntryCallLogActionCopyWithImpl;
@override @useResult
$Res call({
 CallEntry entry
});




}
/// @nodoc
class _$SelectEntryCallLogActionCopyWithImpl<$Res>
    implements $SelectEntryCallLogActionCopyWith<$Res> {
  _$SelectEntryCallLogActionCopyWithImpl(this._self, this._then);

  final SelectEntryCallLogAction _self;
  final $Res Function(SelectEntryCallLogAction) _then;

/// Create a copy of CallLogAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(SelectEntryCallLogAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as CallEntry,
  ));
}


}

// dart format on
