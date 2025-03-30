// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeAction {

 RegionCode? get current;
/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeActionCopyWith<HomeAction> get copyWith => _$HomeActionCopyWithImpl<HomeAction>(this as HomeAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAction&&(identical(other.current, current) || other.current == current));
}


@override
int get hashCode => Object.hash(runtimeType,current);

@override
String toString() {
  return 'HomeAction(current: $current)';
}


}

/// @nodoc
abstract mixin class $HomeActionCopyWith<$Res>  {
  factory $HomeActionCopyWith(HomeAction value, $Res Function(HomeAction) _then) = _$HomeActionCopyWithImpl;
@useResult
$Res call({
 String? current
});




}
/// @nodoc
class _$HomeActionCopyWithImpl<$Res>
    implements $HomeActionCopyWith<$Res> {
  _$HomeActionCopyWithImpl(this._self, this._then);

  final HomeAction _self;
  final $Res Function(HomeAction) _then;

/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = freezed,}) {
  return _then(_self.copyWith(
current: freezed == current ? _self.current! : current // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class NavigateToRegionPickerHomeAction implements HomeAction {
   NavigateToRegionPickerHomeAction(this.current);
  

@override final  String? current;

/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToRegionPickerHomeActionCopyWith<NavigateToRegionPickerHomeAction> get copyWith => _$NavigateToRegionPickerHomeActionCopyWithImpl<NavigateToRegionPickerHomeAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToRegionPickerHomeAction&&(identical(other.current, current) || other.current == current));
}


@override
int get hashCode => Object.hash(runtimeType,current);

@override
String toString() {
  return 'HomeAction.navigateToRegionPicker(current: $current)';
}


}

/// @nodoc
abstract mixin class $NavigateToRegionPickerHomeActionCopyWith<$Res> implements $HomeActionCopyWith<$Res> {
  factory $NavigateToRegionPickerHomeActionCopyWith(NavigateToRegionPickerHomeAction value, $Res Function(NavigateToRegionPickerHomeAction) _then) = _$NavigateToRegionPickerHomeActionCopyWithImpl;
@override @useResult
$Res call({
 String? current
});




}
/// @nodoc
class _$NavigateToRegionPickerHomeActionCopyWithImpl<$Res>
    implements $NavigateToRegionPickerHomeActionCopyWith<$Res> {
  _$NavigateToRegionPickerHomeActionCopyWithImpl(this._self, this._then);

  final NavigateToRegionPickerHomeAction _self;
  final $Res Function(NavigateToRegionPickerHomeAction) _then;

/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = freezed,}) {
  return _then(NavigateToRegionPickerHomeAction(
freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
