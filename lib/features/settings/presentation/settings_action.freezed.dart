// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsAction {

 String get route; Object? get args;
/// Create a copy of SettingsAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsActionCopyWith<SettingsAction> get copyWith => _$SettingsActionCopyWithImpl<SettingsAction>(this as SettingsAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsAction&&(identical(other.route, route) || other.route == route)&&const DeepCollectionEquality().equals(other.args, args));
}


@override
int get hashCode => Object.hash(runtimeType,route,const DeepCollectionEquality().hash(args));

@override
String toString() {
  return 'SettingsAction(route: $route, args: $args)';
}


}

/// @nodoc
abstract mixin class $SettingsActionCopyWith<$Res>  {
  factory $SettingsActionCopyWith(SettingsAction value, $Res Function(SettingsAction) _then) = _$SettingsActionCopyWithImpl;
@useResult
$Res call({
 String route, Object? args
});




}
/// @nodoc
class _$SettingsActionCopyWithImpl<$Res>
    implements $SettingsActionCopyWith<$Res> {
  _$SettingsActionCopyWithImpl(this._self, this._then);

  final SettingsAction _self;
  final $Res Function(SettingsAction) _then;

/// Create a copy of SettingsAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? route = null,Object? args = freezed,}) {
  return _then(_self.copyWith(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,args: freezed == args ? _self.args : args ,
  ));
}

}


/// @nodoc


class NavigateSettingsAction implements SettingsAction {
   NavigateSettingsAction(this.route, {this.args = null});
  

@override final  String route;
@override@JsonKey() final  Object? args;

/// Create a copy of SettingsAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateSettingsActionCopyWith<NavigateSettingsAction> get copyWith => _$NavigateSettingsActionCopyWithImpl<NavigateSettingsAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateSettingsAction&&(identical(other.route, route) || other.route == route)&&const DeepCollectionEquality().equals(other.args, args));
}


@override
int get hashCode => Object.hash(runtimeType,route,const DeepCollectionEquality().hash(args));

@override
String toString() {
  return 'SettingsAction.navigateTo(route: $route, args: $args)';
}


}

/// @nodoc
abstract mixin class $NavigateSettingsActionCopyWith<$Res> implements $SettingsActionCopyWith<$Res> {
  factory $NavigateSettingsActionCopyWith(NavigateSettingsAction value, $Res Function(NavigateSettingsAction) _then) = _$NavigateSettingsActionCopyWithImpl;
@override @useResult
$Res call({
 String route, Object? args
});




}
/// @nodoc
class _$NavigateSettingsActionCopyWithImpl<$Res>
    implements $NavigateSettingsActionCopyWith<$Res> {
  _$NavigateSettingsActionCopyWithImpl(this._self, this._then);

  final NavigateSettingsAction _self;
  final $Res Function(NavigateSettingsAction) _then;

/// Create a copy of SettingsAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? route = null,Object? args = freezed,}) {
  return _then(NavigateSettingsAction(
null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,args: freezed == args ? _self.args : args ,
  ));
}


}

// dart format on
