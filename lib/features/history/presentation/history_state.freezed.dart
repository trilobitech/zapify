// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState()';
}


}

/// @nodoc
class $HistoryStateCopyWith<$Res>  {
$HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}


/// @nodoc


class LoadingHistoryState implements HistoryState {
   LoadingHistoryState(this.size);
  

 final  int size;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingHistoryStateCopyWith<LoadingHistoryState> get copyWith => _$LoadingHistoryStateCopyWithImpl<LoadingHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingHistoryState&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,size);

@override
String toString() {
  return 'HistoryState.loading(size: $size)';
}


}

/// @nodoc
abstract mixin class $LoadingHistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $LoadingHistoryStateCopyWith(LoadingHistoryState value, $Res Function(LoadingHistoryState) _then) = _$LoadingHistoryStateCopyWithImpl;
@useResult
$Res call({
 int size
});




}
/// @nodoc
class _$LoadingHistoryStateCopyWithImpl<$Res>
    implements $LoadingHistoryStateCopyWith<$Res> {
  _$LoadingHistoryStateCopyWithImpl(this._self, this._then);

  final LoadingHistoryState _self;
  final $Res Function(LoadingHistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? size = null,}) {
  return _then(LoadingHistoryState(
null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class EmptyHistoryState implements HistoryState {
   EmptyHistoryState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.empty()';
}


}




/// @nodoc


class LoadedHistoryState implements HistoryState {
   LoadedHistoryState({required final  List<HistoryEntry> entries, this.isDismissible = false}): _entries = entries;
  

 final  List<HistoryEntry> _entries;
 List<HistoryEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@JsonKey() final  bool isDismissible;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedHistoryStateCopyWith<LoadedHistoryState> get copyWith => _$LoadedHistoryStateCopyWithImpl<LoadedHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedHistoryState&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.isDismissible, isDismissible) || other.isDismissible == isDismissible));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),isDismissible);

@override
String toString() {
  return 'HistoryState(entries: $entries, isDismissible: $isDismissible)';
}


}

/// @nodoc
abstract mixin class $LoadedHistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $LoadedHistoryStateCopyWith(LoadedHistoryState value, $Res Function(LoadedHistoryState) _then) = _$LoadedHistoryStateCopyWithImpl;
@useResult
$Res call({
 List<HistoryEntry> entries, bool isDismissible
});




}
/// @nodoc
class _$LoadedHistoryStateCopyWithImpl<$Res>
    implements $LoadedHistoryStateCopyWith<$Res> {
  _$LoadedHistoryStateCopyWithImpl(this._self, this._then);

  final LoadedHistoryState _self;
  final $Res Function(LoadedHistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? isDismissible = null,}) {
  return _then(LoadedHistoryState(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,isDismissible: null == isDismissible ? _self.isDismissible : isDismissible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$HistoryAction {

 HistoryEntry get entry;
/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryActionCopyWith<HistoryAction> get copyWith => _$HistoryActionCopyWithImpl<HistoryAction>(this as HistoryAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'HistoryAction(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $HistoryActionCopyWith<$Res>  {
  factory $HistoryActionCopyWith(HistoryAction value, $Res Function(HistoryAction) _then) = _$HistoryActionCopyWithImpl;
@useResult
$Res call({
 HistoryEntry entry
});




}
/// @nodoc
class _$HistoryActionCopyWithImpl<$Res>
    implements $HistoryActionCopyWith<$Res> {
  _$HistoryActionCopyWithImpl(this._self, this._then);

  final HistoryAction _self;
  final $Res Function(HistoryAction) _then;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entry = null,}) {
  return _then(_self.copyWith(
entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as HistoryEntry,
  ));
}

}


/// @nodoc


class SelectEntryHistoryAction implements HistoryAction {
   SelectEntryHistoryAction(this.entry);
  

@override final  HistoryEntry entry;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectEntryHistoryActionCopyWith<SelectEntryHistoryAction> get copyWith => _$SelectEntryHistoryActionCopyWithImpl<SelectEntryHistoryAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectEntryHistoryAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'HistoryAction.select(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $SelectEntryHistoryActionCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory $SelectEntryHistoryActionCopyWith(SelectEntryHistoryAction value, $Res Function(SelectEntryHistoryAction) _then) = _$SelectEntryHistoryActionCopyWithImpl;
@override @useResult
$Res call({
 HistoryEntry entry
});




}
/// @nodoc
class _$SelectEntryHistoryActionCopyWithImpl<$Res>
    implements $SelectEntryHistoryActionCopyWith<$Res> {
  _$SelectEntryHistoryActionCopyWithImpl(this._self, this._then);

  final SelectEntryHistoryAction _self;
  final $Res Function(SelectEntryHistoryAction) _then;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(SelectEntryHistoryAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as HistoryEntry,
  ));
}


}

/// @nodoc


class ShowMenuHistoryAction implements HistoryAction {
   ShowMenuHistoryAction(this.entry, this.position, this.options);
  

@override final  HistoryEntry entry;
 final  Offset position;
 final  Iterable<ContextMenuAction> options;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowMenuHistoryActionCopyWith<ShowMenuHistoryAction> get copyWith => _$ShowMenuHistoryActionCopyWithImpl<ShowMenuHistoryAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowMenuHistoryAction&&(identical(other.entry, entry) || other.entry == entry)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,entry,position,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'HistoryAction.showMenu(entry: $entry, position: $position, options: $options)';
}


}

/// @nodoc
abstract mixin class $ShowMenuHistoryActionCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory $ShowMenuHistoryActionCopyWith(ShowMenuHistoryAction value, $Res Function(ShowMenuHistoryAction) _then) = _$ShowMenuHistoryActionCopyWithImpl;
@override @useResult
$Res call({
 HistoryEntry entry, Offset position, Iterable<ContextMenuAction> options
});




}
/// @nodoc
class _$ShowMenuHistoryActionCopyWithImpl<$Res>
    implements $ShowMenuHistoryActionCopyWith<$Res> {
  _$ShowMenuHistoryActionCopyWithImpl(this._self, this._then);

  final ShowMenuHistoryAction _self;
  final $Res Function(ShowMenuHistoryAction) _then;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entry = null,Object? position = null,Object? options = null,}) {
  return _then(ShowMenuHistoryAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as HistoryEntry,null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Offset,null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Iterable<ContextMenuAction>,
  ));
}


}

/// @nodoc


class AskToRestoreEntryHistoryAction implements HistoryAction {
   AskToRestoreEntryHistoryAction(this.entry);
  

@override final  HistoryEntry entry;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskToRestoreEntryHistoryActionCopyWith<AskToRestoreEntryHistoryAction> get copyWith => _$AskToRestoreEntryHistoryActionCopyWithImpl<AskToRestoreEntryHistoryAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskToRestoreEntryHistoryAction&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'HistoryAction.showRestoreEntrySnackBar(entry: $entry)';
}


}

/// @nodoc
abstract mixin class $AskToRestoreEntryHistoryActionCopyWith<$Res> implements $HistoryActionCopyWith<$Res> {
  factory $AskToRestoreEntryHistoryActionCopyWith(AskToRestoreEntryHistoryAction value, $Res Function(AskToRestoreEntryHistoryAction) _then) = _$AskToRestoreEntryHistoryActionCopyWithImpl;
@override @useResult
$Res call({
 HistoryEntry entry
});




}
/// @nodoc
class _$AskToRestoreEntryHistoryActionCopyWithImpl<$Res>
    implements $AskToRestoreEntryHistoryActionCopyWith<$Res> {
  _$AskToRestoreEntryHistoryActionCopyWithImpl(this._self, this._then);

  final AskToRestoreEntryHistoryAction _self;
  final $Res Function(AskToRestoreEntryHistoryAction) _then;

/// Create a copy of HistoryAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(AskToRestoreEntryHistoryAction(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as HistoryEntry,
  ));
}


}

// dart format on
