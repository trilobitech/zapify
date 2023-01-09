import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';
import 'state.dart';

part 'parts/widget.dart';

mixin StateActionMixin<B extends StateActionBloc<S, A>, S extends IState,
    A extends IAction> {
  B? get bloc => null;

  @nonVirtual
  Widget build(BuildContext context) => _StateActionWidget<B, S, A>(
        bloc: bloc,
        stateBuilder: buildState,
        actionHandler: handleAction,
      );

  Widget buildState(BuildContext context, S state);

  FutureOr handleAction(BuildContext context, A action);
}

mixin StateMixin<B extends StateBloc<S>, S extends IState> {
  B? get bloc => null;

  @nonVirtual
  Widget build(BuildContext context) => _StateActionWidget<B, S, IAction>(
        bloc: bloc,
        stateBuilder: buildState,
      );

  Widget buildState(BuildContext context, S state);
}

mixin ActionMixin<B extends ActionBloc<A>, A extends IAction> {
  B? get bloc => null;

  @nonVirtual
  Widget build(BuildContext context) => _StateActionWidget<B, IState, A>(
        bloc: bloc,
        stateBuilder: (context, _) => buildWidget(context),
        actionHandler: handleAction,
      );

  Widget buildWidget(BuildContext context);

  FutureOr handleAction(BuildContext context, A action);
}
