import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';
import 'package:ui/widgets.dart';

import '../../../../../common/ext/context.dart';
import '../../../chat_app/domain/entity/chat_app.dart';
import '../../phone/domain/entities/phone_number.dart';
import '../chat_apps_mediator.dart';
import 'chat_apps_bloc.dart';
import 'chat_apps_state.dart';
import 'dialogs/chat_app_not_found_dialog.dart';
import 'dialogs/invalid_phone_number_dialog.dart';

class ChatAppsWidget extends StatelessWidget
    with StateActionMixin<ChatAppsBloc, ChatAppsState, ChatAppsAction> {
  ChatAppsWidget({super.key});

  @override
  Widget buildState(BuildContext context, ChatAppsState state) =>
      switch (state) {
        LoadedChatAppsState(:final entries) => _SuccessView(entries),
        InitialChatAppsState() => const SizedBox.shrink(),
      };

  @override
  FutureOr<void> handleAction(
    BuildContext context,
    ChatAppsAction action,
  ) => switch (action) {
    SelectEntryChatAppsAction(:final entry, :final phoneNumber) => _openChatApp(
      context,
      entry,
      phoneNumber,
    ),
    ShowFailureMessageChatAppsAction(:final app) => _showChatFailureMessage(
      context,
      app,
    ),
    ShowInvalidPhoneNumberErrorChatAppsAction(:final app, :final phoneNumber) =>
      _showInvalidPhoneNumberError(context, app, phoneNumber),
  };

  Future<void> _openChatApp(
    BuildContext context,
    ChatApp entry,
    PhoneNumberValue? phoneNumber,
  ) async {
    final chatAppsBloc = context.read<ChatAppsBloc>();
    final chatAppsMediator = context.read<ChatAppsMediator>();
    await chatAppsMediator
        .launch(uriTemplate: entry.deeplinkTemplate, phoneNumber: phoneNumber)
        .then((_) {
          chatAppsBloc.chatOpenedSuccessful();
        })
        .catchError((err, stack) {
          chatAppsBloc.selectFailed(entry, err, stack);
        });
  }

  Future<void> _showChatFailureMessage(
    BuildContext context,
    ChatApp app,
  ) async {
    await ChatAppNotFoundDialog.show(context, app);
  }

  Future<void> _showInvalidPhoneNumberError(
    BuildContext context,
    ChatApp app,
    PhoneNumberValue phoneNumber,
  ) async {
    final chatAppsBloc = context.read<ChatAppsBloc>();
    final result = await InvalidPhoneNumberDialog.show(context);
    chatAppsBloc.onInvalidPhoneNumberResult(app, result, phoneNumber);
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
              (index, entry) => _EntryView(position: index, entry: entry),
            )
            .toList(growable: false),
      ),
    );
  }
}

class _EntryView extends StatefulWidget {
  const _EntryView({required this.position, required this.entry});

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
          label: Text(context.strings.homeOpenWithButton(entry.name)),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Color(entry.color.value),
          onPressed: () {
            context.read<ChatAppsBloc>().selected(entry);
          },
        ),
      ),
    );
  }
}
