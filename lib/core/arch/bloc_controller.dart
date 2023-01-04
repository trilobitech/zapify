import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';

typedef EventConsumer<Event> = FutureOr<void> Function(Event event);

abstract class BlocController<Event, State> extends Bloc<Event, State> {
  BlocController(super.initialState) {
    load();
    on<Event>((event, _) => _callEventConsumer(event));
  }

  @protected
  final List<StreamSubscription> subscriptions = [];

  EventConsumer<Event>? _eventConsumer;

  @protected
  Future<void> load() async {}

  @override
  @protected
  // ignore: invalid_use_of_visible_for_testing_member
  void emit(State state) => super.emit(state);

  @protected
  void event(Event event) => add(event);

  void listen(EventConsumer<Event>? consumer) {
    _eventConsumer = consumer;
  }

  @override
  Future<void> close() async {
    subscriptions
      ..forEach((s) => s.cancel())
      ..clear();

    return super.close();
  }

  void _callEventConsumer(event) async {
    try {
      await _eventConsumer?.call(event);
    } catch (e, stack) {
      Log.e(e, stack);
    }
  }
}
