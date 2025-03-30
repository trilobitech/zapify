// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdBannerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdBannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdBannerState()';
}


}

/// @nodoc
class $AdBannerStateCopyWith<$Res>  {
$AdBannerStateCopyWith(AdBannerState _, $Res Function(AdBannerState) __);
}


/// @nodoc


class LoadedAdBannerState implements AdBannerState {
   LoadedAdBannerState({required this.unitId});
  

 final  String unitId;

/// Create a copy of AdBannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedAdBannerStateCopyWith<LoadedAdBannerState> get copyWith => _$LoadedAdBannerStateCopyWithImpl<LoadedAdBannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedAdBannerState&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode => Object.hash(runtimeType,unitId);

@override
String toString() {
  return 'AdBannerState(unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class $LoadedAdBannerStateCopyWith<$Res> implements $AdBannerStateCopyWith<$Res> {
  factory $LoadedAdBannerStateCopyWith(LoadedAdBannerState value, $Res Function(LoadedAdBannerState) _then) = _$LoadedAdBannerStateCopyWithImpl;
@useResult
$Res call({
 String unitId
});




}
/// @nodoc
class _$LoadedAdBannerStateCopyWithImpl<$Res>
    implements $LoadedAdBannerStateCopyWith<$Res> {
  _$LoadedAdBannerStateCopyWithImpl(this._self, this._then);

  final LoadedAdBannerState _self;
  final $Res Function(LoadedAdBannerState) _then;

/// Create a copy of AdBannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unitId = null,}) {
  return _then(LoadedAdBannerState(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoneAdBannerState implements AdBannerState {
   NoneAdBannerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoneAdBannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdBannerState.none()';
}


}




// dart format on
