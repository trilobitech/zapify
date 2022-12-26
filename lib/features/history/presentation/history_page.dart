import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../../../core/di/inject.dart';
import '../../../core/ext/context.dart';
import '../../../core/widgets/shimmer_view.dart';
import '../../home/presentation/widgets/tab_list_view.dart';
import '../../shared/domain/entity/history_entry.dart';
import 'history_controller.dart';
import 'history_state.dart';

typedef OnHistoryEntryTap = Function(String phoneNumber);

class HistoryPage extends StatelessWidget implements TabPage {
  HistoryPage({Key? key, required this.onEntryTap}) : super(key: key);

  late final controller = inject<HistoryController>();
  final OnHistoryEntryTap onEntryTap;

  @override
  IconData get icon => Icons.history;

  @override
  String buildTitle(BuildContext context) => context.strings.recentNumbersTitle;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.state,
      builder: _buildList,
    );
  }

  Widget _buildList(
    BuildContext context,
    AsyncSnapshot<HistoryViewState> snapshot,
  ) {
    if (snapshot.hasData) {
      final state = snapshot.requireData;
      return state.when(
        _buildLoadedListWidget,
        loading: _buildLoadingListWidget,
        empty: () => _buildEmptyListWidget(context),
      );
    }
    if (snapshot.hasError) {
      Log.e(snapshot.error, snapshot.stackTrace);
    }
    return Container();
  }

  Widget _buildLoadedListWidget(List<HistoryEntry> entries) {
    return _buildListWidget(
      entries.length,
      (context, index) => _buildListTile(context, entries[index]),
    );
  }

  Widget _buildLoadingListWidget(int size) =>
      _buildListWidget(size, (_, __) => _buildShimmer());

  Widget _buildListWidget(int itemCount, IndexedWidgetBuilder itemBuilder) {
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (_, __) => const Divider(height: 1),
    );
  }

  Widget _buildListTile(BuildContext context, HistoryEntry entry) {
    return Dismissible(
      key: ValueKey(entry.phoneNumber),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        analytics.itemRemoved('phone_from_history');
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
          analytics.itemSelected('phone_from_history');
          onEntryTap(entry.phoneNumber);
        },
        // onLongPress: () {
        //   analytics.itemLongPressed('phone_from_history');
        // },
      ),
    );
  }

  Widget _buildEmptyListWidget(BuildContext context) {
    return Center(
      child: Text(context.strings.recentNumbersEmpty),
    );
  }

  Widget _buildShimmer() {
    return const ShimmerView(
      child: ListTile(
        title: Text('+99 99 99999-9999'),
        trailing: Text('any time ago'),
      ),
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
          analytics.buttonPressed('restore_phone_from_history');
          controller.restore(entry);
        },
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
