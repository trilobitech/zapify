import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

part 'settings_action.freezed.dart';

@freezed
class SettingsAction with _$SettingsAction implements IAction {
  factory SettingsAction.navigateTo(String route, {@Default(null) Object? args}) = _SettingsActionNavigateTo;
}
