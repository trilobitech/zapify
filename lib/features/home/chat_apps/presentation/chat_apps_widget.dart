import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../../../common/ext/context.dart';
import '../../../../../common/widgets/image_resolver_widget.dart';
import '../chat_apps_mediator.dart';
import '../domain/entity/chat_app.dart';
import 'chat_apps_bloc.dart';
import 'chat_apps_state.dart';

class ChatAppsWidget extends StatelessWidget
    with StateActionMixin<ChatAppsBloc, ChatAppsState, ChatAppsAction> {
  ChatAppsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildState(BuildContext context, ChatAppsState state) => state.when(
        (entries) => _SuccessView(entries),
        initial: () => Container(),
      );

  @override
  FutureOr<void> handleAction(BuildContext context, ChatAppsAction action) =>
      action.when(
        select: (entry) => _openChatApp(context, entry),
      );

  Future<void> _openChatApp(BuildContext context, ChatApp entry) async {
    await context
        .read<ChatAppsMediator>()
        .launch(entry.deepLinkTemplate)
        .catchError(catchErrorLogger);
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView(this.entries);

  final Iterable<ChatApp> entries;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
      child: Row(
        children: entries
            .mapIndexed(
              (index, chatApp) => _EntryView(
                position: index,
                entry: chatApp,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _EntryView extends StatefulWidget {
  const _EntryView({
    Key? key,
    required this.position,
    required this.entry,
  }) : super(key: key);

  final int position;
  final ChatApp entry;

  @override
  State<StatefulWidget> createState() => _EntryViewState();
}

class _EntryViewState extends State<_EntryView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int get position => widget.position;

  ChatApp get entry => widget.entry;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: position * 200 + 150),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(entry.name),
      padding: const EdgeInsets.only(right: 8),
      child: ScaleTransition(
        scale: _animation,
        child: ActionChip(
          avatar: ImageResolverWidget.icon(
            uri: entry.icon,
            color: Colors.white,
          ),
          label: Text(
            context.strings.homeOpenWithButton.format([entry.name]),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Color(entry.brandColor.value),
          onPressed: () {
            context.read<ChatAppsBloc>().selected(entry);
          },
        ),
      ),
    );
  }
}
