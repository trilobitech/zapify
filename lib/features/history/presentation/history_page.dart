import 'package:flutter/material.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/logger.dart';
import 'package:zapfy/features/history/presentation/history_controller.dart';
import 'package:zapfy/features/history/presentation/history_state.dart';
import 'package:zapfy/features/shared/domain/entity/history_entry.dart';

typedef OnHistoryEntryTap = Function(String phoneNumber);

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key, required this.onEntryTap}) : super(key: key);

  late final controller = inject<HistoryController>();
  final OnHistoryEntryTap onEntryTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Recent numbers',
            style: theme.textTheme.headline6,
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: controller.state,
            builder: (context, AsyncSnapshot<HistoryViewState> snapshot) =>
                _buildList(snapshot),
          ),
        ),
      ],
    );
  }

  Widget _buildList(AsyncSnapshot<HistoryViewState> snapshot) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return state.when(
        _buildListWidget,
        empty: _buildEmptyListWidget,
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  Widget _buildEmptyListWidget() {
    return const Center(
      child: Text('No history'),
    );
  }

  Widget _buildListWidget(List<HistoryEntry> entries) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (context, index) => _buildListTile(context, entries[index]),
      separatorBuilder: (_, __) => const Divider(height: 0),
    );
  }

  Widget _buildListTile(BuildContext context, HistoryEntry entry) {
    return Dismissible(
      key: ValueKey(entry.phoneNumber),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        controller.remove(entry);
        _showRestoreEntrySnackBar(context, entry);
      },
      background: Container(
        color: const Color.fromARGB(255, 186, 12, 0),
        child: Stack(
          children: const [
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Icon(Icons.cancel, color: Colors.white),
            ),
          ],
        ),
      ),
      child: ListTile(
        title: Text(entry.phoneNumber),
        trailing: Timeago(
          date: entry.lastUsageAt,
          builder: (_, text) => Text(text),
        ),
        onTap: () {
          onEntryTap(entry.phoneNumber);
        },
      ),
    );
  }

  _showRestoreEntrySnackBar(BuildContext context, HistoryEntry entry) {
    final snackBar = SnackBar(
      content: Text(
        'Recent number "${entry.phoneNumber}" was removed!',
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          controller.restore(entry);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
