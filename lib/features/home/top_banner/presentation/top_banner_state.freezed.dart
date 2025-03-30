// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopBannerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopBannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopBannerState()';
}


}

/// @nodoc
class $TopBannerStateCopyWith<$Res>  {
$TopBannerStateCopyWith(TopBannerState _, $Res Function(TopBannerState) __);
}


/// @nodoc


class DisplayTopBannerState implements TopBannerState {
   DisplayTopBannerState({required this.type});
  

 final  TopBannerType type;

/// Create a copy of TopBannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayTopBannerStateCopyWith<DisplayTopBannerState> get copyWith => _$DisplayTopBannerStateCopyWithImpl<DisplayTopBannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayTopBannerState&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'TopBannerState(type: $type)';
}


}

/// @nodoc
abstract mixin class $DisplayTopBannerStateCopyWith<$Res> implements $TopBannerStateCopyWith<$Res> {
  factory $DisplayTopBannerStateCopyWith(DisplayTopBannerState value, $Res Function(DisplayTopBannerState) _then) = _$DisplayTopBannerStateCopyWithImpl;
@useResult
$Res call({
 TopBannerType type
});




}
/// @nodoc
class _$DisplayTopBannerStateCopyWithImpl<$Res>
    implements $DisplayTopBannerStateCopyWith<$Res> {
  _$DisplayTopBannerStateCopyWithImpl(this._self, this._then);

  final DisplayTopBannerState _self;
  final $Res Function(DisplayTopBannerState) _then;

/// Create a copy of TopBannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(DisplayTopBannerState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TopBannerType,
  ));
}


}

/// @nodoc


class HiddenTopBannerState implements TopBannerState {
   HiddenTopBannerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HiddenTopBannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopBannerState.none()';
}


}




// dart format on
