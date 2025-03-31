import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logify/logify.dart';

abstract class TabPage implements Widget {
  IconData get icon;

  String buildTitle(BuildContext context);
}

abstract class MaybeAvailableTabPage implements TabPage {
  FutureOr<bool> get isTabAvailable;
}

class TabListView extends StatelessWidget {
  const TabListView({super.key, required this.tabs});

  final List<TabPage> tabs;
  Future<List<TabPage>> get _filteredTabs => _filterAvailableTabs().toList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TabPage>>(
      future: _filteredTabs,
      builder: (_, snapshot) => _buildTabs(snapshot),
    );
  }

  Stream<TabPage> _filterAvailableTabs() async* {
    for (final tab in tabs) {
      if (tab is! MaybeAvailableTabPage || await tab.isTabAvailable) {
        yield tab;
      }
    }
  }

  StatelessWidget _buildTabs(AsyncSnapshot<List<TabPage>> snapshot) {
    if (!snapshot.hasData) {
      if (snapshot.hasError) {
        Log.e(snapshot.error);
      }

      return Container();
    }

    final tabs = snapshot.requireData;

    if (tabs.length == 1) {
      return _SingleTabPage(tabs.first);
    }

    return _MultiTabPage(tabs);
  }
}

class _SingleTabPage extends StatelessWidget {
  const _SingleTabPage(this.page);

  final TabPage page;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            page.buildTitle(context),
            style: theme.textTheme.titleLarge,
          ),
        ),
        Expanded(child: page),
      ],
    );
  }
}

class _MultiTabPage extends StatelessWidget {
  _MultiTabPage(this.tabs);

  final List<TabPage> tabs;

  late final List<Tab> tabSelectors = tabs
      .map((tab) => Tab(child: _TabIndicatorView(tab)))
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(tabs: tabSelectors),
        body: TabBarView(children: tabs),
      ),
    );
  }
}

class _TabIndicatorView extends StatelessWidget {
  const _TabIndicatorView(this.tab);

  final TabPage tab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(tab.icon),
        const SizedBox(width: 8),
        Text(tab.buildTitle(context)),
      ],
    );
  }
}
