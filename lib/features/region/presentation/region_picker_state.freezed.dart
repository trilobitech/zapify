// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegionPickerState {

 List<Country> get countries;
/// Create a copy of RegionPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionPickerStateCopyWith<RegionPickerState> get copyWith => _$RegionPickerStateCopyWithImpl<RegionPickerState>(this as RegionPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionPickerState&&const DeepCollectionEquality().equals(other.countries, countries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(countries));

@override
String toString() {
  return 'RegionPickerState(countries: $countries)';
}


}

/// @nodoc
abstract mixin class $RegionPickerStateCopyWith<$Res>  {
  factory $RegionPickerStateCopyWith(RegionPickerState value, $Res Function(RegionPickerState) _then) = _$RegionPickerStateCopyWithImpl;
@useResult
$Res call({
 List<Country> countries
});




}
/// @nodoc
class _$RegionPickerStateCopyWithImpl<$Res>
    implements $RegionPickerStateCopyWith<$Res> {
  _$RegionPickerStateCopyWithImpl(this._self, this._then);

  final RegionPickerState _self;
  final $Res Function(RegionPickerState) _then;

/// Create a copy of RegionPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countries = null,}) {
  return _then(_self.copyWith(
countries: null == countries ? _self.countries : countries // ignore: cast_nullable_to_non_nullable
as List<Country>,
  ));
}

}


/// @nodoc


class LoadedRegionPickerState implements RegionPickerState {
   LoadedRegionPickerState({final  List<Country> countries = const []}): _countries = countries;
  

 final  List<Country> _countries;
@override@JsonKey() List<Country> get countries {
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countries);
}


/// Create a copy of RegionPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedRegionPickerStateCopyWith<LoadedRegionPickerState> get copyWith => _$LoadedRegionPickerStateCopyWithImpl<LoadedRegionPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedRegionPickerState&&const DeepCollectionEquality().equals(other._countries, _countries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_countries));

@override
String toString() {
  return 'RegionPickerState(countries: $countries)';
}


}

/// @nodoc
abstract mixin class $LoadedRegionPickerStateCopyWith<$Res> implements $RegionPickerStateCopyWith<$Res> {
  factory $LoadedRegionPickerStateCopyWith(LoadedRegionPickerState value, $Res Function(LoadedRegionPickerState) _then) = _$LoadedRegionPickerStateCopyWithImpl;
@override @useResult
$Res call({
 List<Country> countries
});




}
/// @nodoc
class _$LoadedRegionPickerStateCopyWithImpl<$Res>
    implements $LoadedRegionPickerStateCopyWith<$Res> {
  _$LoadedRegionPickerStateCopyWithImpl(this._self, this._then);

  final LoadedRegionPickerState _self;
  final $Res Function(LoadedRegionPickerState) _then;

/// Create a copy of RegionPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countries = null,}) {
  return _then(LoadedRegionPickerState(
countries: null == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<Country>,
  ));
}


}

/// @nodoc
mixin _$RegionPickerAction {

 IRegion? get region;
/// Create a copy of RegionPickerAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionPickerActionCopyWith<RegionPickerAction> get copyWith => _$RegionPickerActionCopyWithImpl<RegionPickerAction>(this as RegionPickerAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionPickerAction&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,region);

@override
String toString() {
  return 'RegionPickerAction(region: $region)';
}


}

/// @nodoc
abstract mixin class $RegionPickerActionCopyWith<$Res>  {
  factory $RegionPickerActionCopyWith(RegionPickerAction value, $Res Function(RegionPickerAction) _then) = _$RegionPickerActionCopyWithImpl;
@useResult
$Res call({
 IRegion? region
});




}
/// @nodoc
class _$RegionPickerActionCopyWithImpl<$Res>
    implements $RegionPickerActionCopyWith<$Res> {
  _$RegionPickerActionCopyWithImpl(this._self, this._then);

  final RegionPickerAction _self;
  final $Res Function(RegionPickerAction) _then;

/// Create a copy of RegionPickerAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = freezed,}) {
  return _then(_self.copyWith(
region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as IRegion?,
  ));
}

}


/// @nodoc


class CloseRegionPickerAction implements RegionPickerAction {
   CloseRegionPickerAction([this.region]);
  

@override final  IRegion? region;

/// Create a copy of RegionPickerAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloseRegionPickerActionCopyWith<CloseRegionPickerAction> get copyWith => _$CloseRegionPickerActionCopyWithImpl<CloseRegionPickerAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseRegionPickerAction&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,region);

@override
String toString() {
  return 'RegionPickerAction.close(region: $region)';
}


}

/// @nodoc
abstract mixin class $CloseRegionPickerActionCopyWith<$Res> implements $RegionPickerActionCopyWith<$Res> {
  factory $CloseRegionPickerActionCopyWith(CloseRegionPickerAction value, $Res Function(CloseRegionPickerAction) _then) = _$CloseRegionPickerActionCopyWithImpl;
@override @useResult
$Res call({
 IRegion? region
});




}
/// @nodoc
class _$CloseRegionPickerActionCopyWithImpl<$Res>
    implements $CloseRegionPickerActionCopyWith<$Res> {
  _$CloseRegionPickerActionCopyWithImpl(this._self, this._then);

  final CloseRegionPickerAction _self;
  final $Res Function(CloseRegionPickerAction) _then;

/// Create a copy of RegionPickerAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = freezed,}) {
  return _then(CloseRegionPickerAction(
freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as IRegion?,
  ));
}


}

// dart format on
