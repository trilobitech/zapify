import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_controller.dart';
import 'provider.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

typedef EventHandler<Event> = void Function(BuildContext context, Event event);

mixin BlocWidget<B extends BlocController<E, S>, E, S> on StatelessWidget
    implements _BaseBlocWidget<B, E, S> {
  @override
  Widget build(BuildContext context) {
    return DiProvider<B>(
      child: Builder(
        builder: (context) {
          context.read<B>().listen((event) => handleEvent(context, event));
          return BlocBuilder<B, S>(builder: buildState);
        },
      ),
    );
  }
}

mixin BlocStateWidget<W extends StatefulWidget, B extends BlocController<E, S>,
    E, S> on State<W> implements _BaseBlocWidget<B, E, S> {
  @override
  Widget build(BuildContext context) {
    return DiProvider<B>(
      child: Builder(
        builder: (context) {
          context.read<B>().listen((event) => handleEvent(context, event));
          return BlocBuilder<B, S>(builder: buildState);
        },
      ),
    );
  }
}

abstract class _BaseBlocWidget<B extends BlocController<E, S>, E, S> {
  Widget buildState(
    BuildContext context,
    S state,
  );

  FutureOr<void> handleEvent(BuildContext context, E event);
}
