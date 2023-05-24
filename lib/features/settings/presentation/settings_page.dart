import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../common/di/provider.dart';
import '../../../common/ext/context.dart';
import 'settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.settingsTitle),
      ),
      body: DiProvider<SettingsBloc>(
        child: const _SettingsList(),
      ),
    );
  }
}

class _SettingsList extends StatelessWidget
    with ActionMixin<SettingsBloc, SettingsAction> {
  const _SettingsList();

  @override
  Widget buildWidget(BuildContext context) {
    final items = [
      _SettingItemTile(
        title: context.strings.settingsRegionTitle,
        subtitle: context.strings.settingsRegionSubtitle,
        onTap: () =>
            context.read<SettingsBloc>().onDefaultRegionOptionClicked(),
      ),
      _SettingItemTile(
        title: context.strings.settingsMessagingAppsTitle,
        subtitle: context.strings.settingsMessagingAppsSubtitle,
        onTap: () =>
            context.read<SettingsBloc>().onMessagingAppsOptionClicked(),
      ),
    ];

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (_, index) => items[index],
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  @override
  FutureOr handleAction(BuildContext context, SettingsAction action) =>
      action.when(
        navigateTo: (route, args) => _navigateTo(context, route, args),
      );

  Future _navigateTo(BuildContext context, String route, dynamic args) async {
    final bloc = context.read<SettingsBloc>();
    final result = await Navigator.pushNamed(context, route, arguments: args);
    await bloc.onOptionUpdated(route, result);
  }
}

class _SettingItemTile extends StatelessWidget {
  const _SettingItemTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios),
      );
}
