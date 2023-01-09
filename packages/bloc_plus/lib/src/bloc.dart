import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

import 'state.dart';

part 'parts/bloc.dart';

abstract class StateActionBloc<S extends IState, A extends IAction>
    extends _StateBloc<S> with _ActionBlocMixin<A, S> {
  StateActionBloc(super.initialState);
}

abstract class StateBloc<S extends IState> extends _StateBloc<S> {
  StateBloc(super.initialState);
}

abstract class ActionBloc<A extends IAction> extends _BlocBase
    with _ActionBlocMixin<A, NoState> {
  ActionBloc() : super(NoState.empty());

  @override
  NoState get currentState => NoState.empty();
}
