import 'package:meta/meta.dart';

abstract class IState {}

abstract class IAction {}

@internal
class NoState implements IState {
  NoState._();

  factory NoState.empty() => NoState._();
}
