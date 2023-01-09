part of '../bloc.dart';

abstract class _StateBloc<S extends IState> extends _BlocBase
    implements _RealStateType<S> {
  _StateBloc(initialState)
      : _currentState = initialState,
        super(initialState);

  S _currentState;
  @override
  S get currentState => state is S ? state as S : _currentState;

  void setState(S newState) {
    _currentState = newState;
    emit(newState);
  }

  void setStateFrom(Stream<S> stream) =>
      stream.listen(setState).addTo(subscriptions);
}

abstract class _BlocBase extends Cubit {
  _BlocBase(super.initialState) {
    load();
  }

  @override
  @internal
  get state => super.state;

  @protected
  final subscriptions = CompositeSubscription();

  @protected
  @visibleForOverriding
  Future<void> load() async {}

  @override
  @internal
  void emit(state) => super.emit(state);

  @override
  Future<void> close() async {
    subscriptions.dispose();
    return super.close();
  }
}

mixin _ActionBlocMixin<A extends IAction, S> on BlocBase
    implements _RealStateType<S> {
  void sendAction(A action) {
    // workarount to enable same action dispatch
    emit(action);
    emit(currentState);
  }
}

abstract class _RealStateType<S> {
  S get currentState;
}
