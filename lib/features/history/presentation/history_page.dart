import 'package:flutter/material.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../../../common/arch/bloc_widget.dart';
import '../../../common/ext/context.dart';
import '../../../common/widgets/feedback_view.dart';
import '../../../common/widgets/list_divider.dart';
import '../../../common/widgets/shimmer_view.dart';
import '../../../common/widgets/tab_list_view.dart';
import '../domain/entity/history.dart';
import '../history_mediator.dart';
import 'history_bloc.dart';
import 'history_state.dart';

class HistoryPage extends StatelessWidget
    with BlocWidget<HistoryBloc, HistoryEvent, HistoryState>
    implements TabPage {
  HistoryPage({super.key});

  @override
  IconData get icon => Icons.history;

  @override
  String buildTitle(BuildContext context) => context.strings.recentNumbersTitle;

  @override
  Widget buildState(BuildContext context, HistoryState state) => state.when(
        (entries) => _SuccessView(entries),
        loading: (size) => _LoadingView(size),
        empty: () => FeedbackView(text: context.strings.recentNumbersEmpty),
      );

  @override
  void handleEvent(BuildContext context, HistoryEvent event) {
    event.when(
      select: (entry) => context
          .read<HistoryMediator>()
          .onPhoneReceivedFromHistory(entry.phoneNumber),
      showRestoreEntrySnackBar: (entry) =>
          _showRestoreEntrySnackBar(context, entry),
    );
  }

  void _showRestoreEntrySnackBar(BuildContext context, HistoryEntry entry) {
    final snackBar = SnackBar(
      content: Text(
        context.strings.recentNumberRemoved.format([entry.phoneNumber]),
      ),
      action: SnackBarAction(
        label: context.strings.undoAction,
        onPressed: () => context.read<HistoryBloc>().restore(entry),
      ),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
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
  const _SuccessView(this.entries);

  final Iterable<HistoryEntry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (_, index) => _EntryView(entries.elementAt(index)),
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _EntryView extends StatelessWidget {
  const _EntryView(this.entry);

  final HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(entry.phoneNumber),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => context.read<HistoryBloc>().remove(entry),
      background: Container(
        color: const Color.fromARGB(255, 186, 12, 0),
        child: Stack(
          children: const [
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ],
        ),
      ),
      child: ListTile(
        title: Text(entry.phoneNumber),
        trailing: Timeago(
          date: entry.lastUsageAt,
          builder: (_, text) => Text(text),
          locale: context.currentLocale.toLanguageTag(),
        ),
        onTap: () => context.read<HistoryBloc>().select(entry),
        onLongPress: () => context.read<HistoryBloc>().longPress(entry),
      ),
    );
  }
}
