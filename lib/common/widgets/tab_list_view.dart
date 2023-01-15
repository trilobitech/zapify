import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';

abstract class TabPage implements Widget {
  IconData get icon;

  String buildTitle(BuildContext context);
}

abstract class MaybeAvailableTabPage implements TabPage {
  FutureOr<bool> get isTabAvailable;
}

class TabListView extends StatelessWidget {
  const TabListView({required this.tabs, super.key});

  final List<TabPage> tabs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<bool>>(
      future: Future.wait(
        tabs.map(
          (e) async => e is! MaybeAvailableTabPage || await e.isTabAvailable,
        ),
      ),
      builder: (context, snapshot) => _buildTabs(snapshot),
    );
  }

  StatelessWidget _buildTabs(AsyncSnapshot<List<bool>> snapshot) {
    if (!snapshot.hasData) {
      if (snapshot.hasError) {
        Log.e(snapshot.error);
      }
      return Container();
    }

    final tabs =
        this.tabs.whereIndexed((index, page) => snapshot.requireData[index]);

    if (tabs.length == 1) {
      return _SingleTabPage(tabs.first);
    }

    return _MultiTabPage(tabs.toList(growable: false));
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
            style: theme.textTheme.headline6,
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
      .map(
        (tab) => Tab(
          child: _TabIndicatorView(tab),
        ),
      )
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: tabSelectors,
        ),
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
