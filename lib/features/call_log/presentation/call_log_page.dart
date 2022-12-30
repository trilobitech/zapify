import 'package:flutter/material.dart';

import '../../../config/remote_config.dart';
import '../../../core/di/inject.dart';
import '../../../core/ext/context.dart';
import '../../../core/widgets/feedback_view.dart';
import '../../../core/widgets/list_divider.dart';
import '../../../core/widgets/shimmer_view.dart';
import '../../../l10n/l10n_ext.dart';
import '../../home/presentation/widgets/tab_list_view.dart';
import 'call_log_controller.dart';
import 'call_log_state.dart';

typedef OnCallLogEntryTap = Function(String phoneNumber);

class CallLogTabPage extends StatefulWidget implements MaybeAvailableTabPage {
  CallLogTabPage({
    super.key,
    required this.onEntryTap,
  });

  final OnCallLogEntryTap onEntryTap;

  @override
  IconData get icon => Icons.call;

  @override
  late final Future<bool> isTabAvailable =
      RemoteConfig.isCallLogTabEnabled.get();

  @override
  String buildTitle(BuildContext context) => context.strings.callLogTabTitle;

  @override
  State<CallLogTabPage> createState() => _CallLogTabPageState();
}

class _CallLogTabPageState extends State<CallLogTabPage>
    with AutomaticKeepAliveClientMixin {
  late final controller = inject<CallLogController>();
  @override
  bool wantKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: controller.state,
      builder: _buildState,
    );
  }

  Widget _buildState(
    BuildContext context,
    AsyncSnapshot<CallLogState> snapshot,
  ) {
    if (!snapshot.hasData) return Container();

    return snapshot.requireData.when(
      (entries) => _CallLogListView(entries, widget.onEntryTap),
      loading: (itemCount) => _LoadingView(itemCount),
      empty: () => FeedbackView(text: context.strings.callLogEmptyMessage),
      error: (error) => ErrorFeedbackView(
        context,
        error: error,
        onRetryPressed: controller.retry,
      ),
    );
  }
}

class _CallLogListView extends StatelessWidget {
  const _CallLogListView(this.entries, this.onEntryTap);

  final Iterable<CallItem> entries;

  final OnCallLogEntryTap onEntryTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (_, index) =>
          _CallEntryView(entries.elementAt(index), onEntryTap),
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView(this.itemCount);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: (_, __) => ShimmerView(
        child: _CallEntryView.fake(),
      ),
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _CallEntryView extends StatelessWidget {
  _CallEntryView(this.item, OnCallLogEntryTap? onEntryTap)
      : onTap = onEntryTap == null ? null : (() => onEntryTap(item.number));

  factory _CallEntryView.fake() => _CallEntryView(
        CallItem(
          leading: Leading(
            icon: Icons.circle_outlined,
          ),
          title: '■■ ■■ ■■■■■-■■■■',
          subtitle: '■■/■■/■■■■ ■■:■■',
          date: DateTime(2022, 12, 30, 18, 50),
          number: '',
        ),
        null,
      );

  final CallItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: item.leading.color,
        child: Icon(item.leading.icon),
      ),
      title: Text(item.title),
      subtitle: Text(item.subtitle ?? context.strings.formatDate(item.date)),
      onTap: onTap,
    );
  }
}
