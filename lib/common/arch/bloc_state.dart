abstract class IState {}

abstract class IAction {}

class NoAction implements IAction {}

class NoState implements IState {
  NoState._();

  factory NoState.empty() => NoState._();
}
