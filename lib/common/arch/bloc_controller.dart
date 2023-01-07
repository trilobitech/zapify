import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/utils.dart';

import 'bloc_state.dart';

export 'bloc_state.dart' show NoAction, NoState;

class BlocController<S extends IState, A extends IAction>
    extends Cubit<Object> {
  BlocController(initialState)
      : _currentState = initialState,
        super(initialState) {
    load();
  }

  final _subscriptions = CompositeSubscription();

  S _currentState;

  S get currentState => state is S ? state as S : _currentState;

  @override
  @visibleForTesting
  Object get state => super.state;

  @protected
  @visibleForOverriding
  Future<void> load() async {}

  void setState(S newState) {
    _currentState = newState;
    super.emit(newState);
  }

  void setStateFrom(Stream<S> stream) {
    stream.listen(setState).addTo(_subscriptions);
  }

  void sendAction(A action) {
    // workarount to enable same action dispatch
    super.emit(action);
    super.emit(currentState);
  }

  @override
  @alwaysThrows
  @visibleForTesting
  void emit(state) =>
      throw UnsupportedError('Use `setState` or `sendAction` instead');

  @override
  Future<void> close() async {
    _subscriptions.dispose();
    return super.close();
  }
}
