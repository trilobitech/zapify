import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/ext/context.dart';
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
            context.strings.recentNumbersTitle,
            style: theme.textTheme.headline6,
          ),
        ),
        Expanded(
          child: StreamBuilder(
            initialData: HistoryViewState.loading(controller.historicSize),
            stream: controller.state,
            builder: _buildList,
          ),
        ),
      ],
    );
  }

  Widget _buildList(
    BuildContext context,
    AsyncSnapshot<HistoryViewState> snapshot,
  ) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return state.when(
        _buildListWidget,
        loading: (size) => _buildLoadingListWidget(context, size),
        empty: () => _buildEmptyListWidget(context),
      );
    }
    if (snapshot.hasError) {
      logError(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  Widget _buildListWidget(List<HistoryEntry> entries) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (context, index) => _buildListTile(context, entries[index]),
      separatorBuilder: (_, __) => const Divider(height: 1),
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
        onTap: () {
          onEntryTap(entry.phoneNumber);
        },
      ),
    );
  }

  Widget _buildEmptyListWidget(BuildContext context) {
    return Center(
      child: Text(context.strings.recentNumbersEmpty),
    );
  }

  Widget _buildLoadingListWidget(BuildContext context, int size) {
    return ListView.separated(
      itemCount: size,
      itemBuilder: (context, _) => Shimmer.fromColors(
        loop: 10,
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade100,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const ListTile(
            title: Text('+99 99 99999-9999'),
            trailing: Text('any past moment'),
          ),
        ),
      ),
      separatorBuilder: (_, __) => const Divider(height: 1),
    );
  }

  _showRestoreEntrySnackBar(BuildContext context, HistoryEntry entry) {
    final snackBar = SnackBar(
      content: Text(
        context.strings.recentNumberRemoved.format([entry.phoneNumber]),
      ),
      action: SnackBarAction(
        label: context.strings.undoAction,
        onPressed: () {
          controller.restore(entry);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
