import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../common/config/remote_config.dart';
import '../../../common/ext/context.dart';
import '../../../common/widgets/feedback_view.dart';
import '../../../common/widgets/list_divider.dart';
import '../../../common/widgets/shimmer_view.dart';
import '../../../common/widgets/tab_list_view.dart';
import '../call_log_mediator.dart';
import 'call_log_bloc.dart';
import 'call_log_error_registry.dart';
import 'call_log_state.dart';

class CallLogTabPage extends StatelessWidget
    with StateActionMixin<CallLogBloc, CallLogState, CallLogAction>
    implements MaybeAvailableTabPage {
  CallLogTabPage({super.key});

  @override
  late final IconData icon = Icons.call;

  @override
  late final Future<bool> isTabAvailable =
      RemoteConfig.isCallLogTabEnabled.get();

  @override
  String buildTitle(BuildContext context) => context.strings.callLogTabTitle;

  @override
  Widget buildState(BuildContext context, CallLogState state) => state.when(
        (entries) => _SuccessView(entries),
        loading: (itemCount) => _LoadingView(itemCount),
        empty: () => FeedbackView(text: context.strings.callLogEmptyMessage),
        error: (error) => ErrorFeedbackView(
          context,
          error: error,
          onRetryPressed: () => context.read<CallLogBloc>().retry(),
          additionalRegistry: CallLogErrorConverterRegistry(),
        ),
      );

  @override
  FutureOr<void> handleAction(BuildContext context, CallLogAction action) =>
      action.when(
        select: (entry) => context
            .read<CallLogMediator>()
            .onPhoneReceivedFromCallLog(entry.phoneNumber),
      );
}

class _SuccessView extends StatelessWidget {
  const _SuccessView(this.entries);

  final Iterable<CallEntry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (_, index) => _EntryView(entries.elementAt(index)),
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
        child: _EntryView.fake(),
      ),
      separatorBuilder: (_, __) => const ListDivider(),
    );
  }
}

class _EntryView extends StatelessWidget {
  const _EntryView(this.entry);

  factory _EntryView.fake() => _EntryView(
        CallEntry(
          leading: Leading(icon: Icons.circle_outlined),
          title: '■■ ■■ ■■■■■-■■■■',
          subtitle: '■■/■■/■■■■ ■■:■■',
          date: DateTime(2022, 12, 30, 18, 50),
          phoneNumber: '',
        ),
      );

  final CallEntry entry;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: entry.leading.color,
        child: Icon(entry.leading.icon),
      ),
      title: Text(entry.title),
      subtitle: Text(entry.subtitle ?? context.strings.formatDate(entry.date)),
      onTap: () => context.read<CallLogBloc>().selected(entry),
    );
  }
}
