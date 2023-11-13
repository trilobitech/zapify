import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resources/strings.dart';
import 'package:state_action_bloc/state_action_bloc.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../../../common/widgets/feedback_view.dart';
import '../../../common/widgets/list_divider.dart';
import '../../../common/widgets/shimmer_view.dart';
import '../../../common/widgets/tab_page.dart';
import '../domain/entity/history.dart';
import '../history_mediator.dart';
import 'history_bloc.dart';
import 'history_state.dart';

class HistoryPage extends StatelessWidget
    with StateActionMixin<HistoryBloc, HistoryState, HistoryAction>
    implements TabPage {
  HistoryPage({super.key});

  @override
  IconData get icon => Icons.history;

  @override
  String buildTitle(BuildContext context) => context.strings.recentNumbersTitle;

  @override
  Widget buildState(BuildContext context, HistoryState state) => state.when(
        (entries, isDismissable) => _SuccessView(
          entries,
          isDismissable: isDismissable,
        ),
        loading: (size) => _LoadingView(size),
        empty: () => FeedbackView(text: context.strings.recentNumbersEmpty),
      );

  @override
  FutureOr<void> handleAction(BuildContext context, HistoryAction action) =>
      action.when(
        select: (entry) => context
            .read<HistoryMediator>()
            .onPhoneReceivedFromHistory(entry.phoneNumber),
        showMenu: (entry, tapPosition, options) =>
            showContextMenu(context, entry, tapPosition, options),
        showRestoreEntrySnackBar: (entry) =>
            _showRestoreEntrySnackBar(context, entry),
      );

  void _showRestoreEntrySnackBar(BuildContext context, HistoryEntry entry) {
    final snackBar = SnackBar(
      content: Text(
        context.strings.recentNumberRemoved(entry.phoneNumber),
      ),
      action: SnackBarAction(
        label: context.strings.actionUndo,
        onPressed: () async => context.read<HistoryBloc>().restore(entry),
      ),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future<void> showContextMenu(
    BuildContext context,
    HistoryEntry entry,
    Offset tapPosition,
    Iterable<ContextMenuAction> options,
  ) async {
    final bloc = context.read<HistoryBloc>();
    final overlay = Overlay.of(context).context.findRenderObject()!;

    final overlaySize = overlay.paintBounds.size;
    final action = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(tapPosition.dx, tapPosition.dy, 30, 30),
        Rect.fromLTWH(0, 0, overlaySize.width, overlaySize.height),
      ),
      items: options.map((e) => e.asPopupMenuItem(context)).toList(),
    );

    await bloc.selectOption(entry, action);
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView(this.itemCount);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: (_, __) => const ShimmerView(
        child: ListTile(
          title: Text('■■■ ■■ ■■■■■-■■■■'),
          trailing: Text('■■■ ■■■■ ■■■'),
        ),
      ),
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView(
    this.entries, {
    required this.isDismissable,
  });

  final Iterable<HistoryEntry> entries;
  final bool isDismissable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (_, index) {
        final entry = entries.elementAt(index);

        if (isDismissable) {
          return _DismissibleEntryView(entry);
        }

        return _EntryView(
          entry,
          key: ValueKey(entry.phoneNumber),
        );
      },
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _DismissibleEntryView extends StatelessWidget {
  const _DismissibleEntryView(this.entry);

  final HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(entry.phoneNumber),
      direction: DismissDirection.endToStart,
      onDismissed: (_) async => context.read<HistoryBloc>().remove(entry),
      background: Container(
        color: const Color.fromARGB(255, 186, 12, 0),
        child: const Stack(
          children: [
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ],
        ),
      ),
      child: _EntryView(entry),
    );
  }
}

class _EntryView extends StatelessWidget {
  const _EntryView(this.entry, {super.key});

  final HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) =>
          context.read<HistoryBloc>().tapPositionFrom(details),
      child: ListTile(
        title: Text(entry.phoneNumber),
        trailing: Timeago(
          date: entry.lastUsageAt,
          builder: (_, text) => Text(text),
          locale: Localizations.localeOf(context).toLanguageTag(),
        ),
        onTap: () => context.read<HistoryBloc>().select(entry),
        onLongPress: () => context.read<HistoryBloc>().longPress(entry),
      ),
    );
  }
}

extension _ContextMenuItem on ContextMenuAction {
  PopupMenuItem<ContextMenuAction> asPopupMenuItem(BuildContext context) {
    final label = this.label(context);

    return PopupMenuItem(
      value: this,
      child: Text(label),
    );
  }

  String label(BuildContext context) {
    switch (this) {
      case ContextMenuAction.remove:
        return context.strings.actionRemove;
    }
  }
}
