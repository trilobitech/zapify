import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';
import 'package:ui/widgets.dart';

import '../../../common/di/provider.dart';
import '../../../common/ext/context.dart';
import '../domain/entity/chat_app.dart';
import 'chat_app_bloc.dart';
import 'chat_app_state.dart';

class ChatAppSettingsPage extends StatelessWidget {
  const ChatAppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.strings.messagingAppsTitle)),
    body: DiProvider<ChatAppBloc>(child: const _ChatAppSettingsContent()),
  );
}

class _ChatAppSettingsContent extends StatelessWidget
    with StateMixin<ChatAppBloc, ChatAppState> {
  const _ChatAppSettingsContent();

  @override
  Widget buildState(BuildContext context, ChatAppState state) {
    return ListView(
      children: [
        if (state.enabled.isNotEmpty)
          _SectionHeader(title: context.strings.messagingAppsEnabledHeader),
        ...state.enabled.map(_mapItemToWidget),
        if (state.disabled.isNotEmpty)
          _SectionHeader(title: context.strings.messagingAppsDisabledHeader),
        ...state.disabled.map(_mapItemToWidget),
      ],
    );
  }

  Widget _mapItemToWidget(ChatApp item) =>
      _ChatAppItem(key: ValueKey('chat-app:${item.id}'), item: item);
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(title, style: Theme.of(context).textTheme.titleLarge),
  );
}

class _ChatAppItem extends ListTile {
  _ChatAppItem({required ChatApp item, super.key})
    : super(
        leading: ImageResolverWidget.icon(
          uri: item.icon,
          color: Color(item.color.value),
        ),
        title: Text(item.name),
        trailing:
            item.isEnabled
                ? _ButtonDisable(item: item)
                : _ButtonEnable(item: item),
      );
}

class _ButtonDisable extends StatelessWidget {
  const _ButtonDisable({required this.item});

  final ChatApp item;

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.remove_circle, color: Colors.red),
    onPressed: () async => context.read<ChatAppBloc>().disable(item),
  );
}

class _ButtonEnable extends StatelessWidget {
  const _ButtonEnable({required this.item});

  final ChatApp item;

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.add_circle, color: Colors.green),
    onPressed: () async => context.read<ChatAppBloc>().enable(item),
  );
}
