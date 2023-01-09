part of '../widget.dart';

typedef WidgetStateBuilder<S extends IState> = Widget Function(
  BuildContext context,
  S state,
);

typedef WidgetActionHandler<A extends IAction> = FutureOr Function(
  BuildContext context,
  A action,
);

class _StateActionWidget<B extends BlocBase, S extends IState,
    A extends IAction> extends StatelessWidget {
  const _StateActionWidget({
    super.key,
    this.bloc,
    required this.stateBuilder,
    this.actionHandler,
  });

  final B? bloc;
  final WidgetStateBuilder<S> stateBuilder;
  final WidgetActionHandler<A>? actionHandler;

  @override
  Widget build(BuildContext context) {
    final bloc = this.bloc;

    final consumer = BlocConsumer<B, dynamic>(
      listenWhen: (_, current) => current is A,
      listener: _handleAction,
      buildWhen: (previous, current) =>
          current is S && previous is! A && previous != current,
      builder: _buildState,
    );

    if (bloc == null) return consumer;

    return BlocProvider<B>.value(value: bloc, child: consumer);
  }

  Widget _buildState(BuildContext context, state) =>
      stateBuilder(context, state as S);

  void _handleAction(BuildContext context, action) async {
    try {
      await actionHandler?.call(context, action as A);
    } catch (e, stack) {
      Log.e(e, stack);
    }
  }
}
