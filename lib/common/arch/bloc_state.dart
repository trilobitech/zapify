abstract class IState {}

abstract class IAction {}

class NoState implements IState {
  NoState._();

  factory NoState.empty() => NoState._();
}
