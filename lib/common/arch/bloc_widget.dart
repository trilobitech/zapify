import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';

import 'bloc_controller.dart';
import 'bloc_state.dart';
import 'provider.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

typedef WidgetStateBuilder<S> = Widget Function(BuildContext context, S state);

typedef WidgetActionHandler<A> = FutureOr Function(
  BuildContext context,
  A action,
);

mixin StateActionMixin<B extends StateActionBloc<S, A>, S extends IState,
    A extends IAction> {
  @nonVirtual
  Widget build(BuildContext context) => DiProvider<B>(
        child: _StateActionWidget<B, S, A>(
          stateBuilder: buildState,
          actionHandler: handleAction,
        ),
      );

  Widget buildState(BuildContext context, S state);

  FutureOr handleAction(BuildContext context, A action);
}

mixin StateMixin<B extends StateBloc<S>, S extends IState> {
  @nonVirtual
  Widget build(BuildContext context) => DiProvider<B>(
        child: _StateActionWidget<B, S, IAction>(
          stateBuilder: buildState,
        ),
      );

  Widget buildState(BuildContext context, S state);
}

mixin ActionMixin<B extends ActionBloc<A>, A extends IAction> {
  @nonVirtual
  Widget build(BuildContext context) => DiProvider<B>(
        child: _StateActionWidget<B, IState, A>(
          stateBuilder: (context, _) => buildWidget(context),
          actionHandler: handleAction,
        ),
      );

  Widget buildWidget(BuildContext context);

  FutureOr handleAction(BuildContext context, A action);
}

class _StateActionWidget<B extends BlocBase, S extends IState,
    A extends IAction> extends StatelessWidget {
  const _StateActionWidget({
    super.key,
    required this.stateBuilder,
    this.actionHandler,
  });

  final WidgetStateBuilder<S> stateBuilder;
  final WidgetActionHandler<A>? actionHandler;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, dynamic>(
      listenWhen: (previous, current) => current is A,
      listener: _handleAction,
      buildWhen: (previous, current) =>
          current is S && previous is! A && previous != current,
      builder: _buildState,
    );
  }

  Widget _buildState(BuildContext context, state) {
    return stateBuilder(context, state as S);
  }

  void _handleAction(BuildContext context, action) async {
    try {
      await actionHandler?.call(context, action as A);
    } catch (e, stack) {
      Log.e(e, stack);
    }
  }
}
