import 'dart:async';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
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
  const _MultiTabPage(this.tabs);

  final List<TabPage> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: tabs
              .mapIndexed(
                (index, tab) => Tab(
                  child: _TabIndicator(
                    index: index,
                    icon: tab.icon,
                    title: tab.buildTitle(context),
                  ),
                ),
              )
              .toList(growable: false),
        ),
        body: TabBarView(children: tabs),
      ),
    );
  }
}

class _TabIndicator extends StatefulWidget {
  const _TabIndicator({
    required this.index,
    required this.icon,
    required this.title,
    // ignore: unused_element
    this.controller,
  });

  _TabIndicator get widget => this;
  final int index;
  final IconData icon;
  final String title;
  final TabController? controller;

  @override
  State<_TabIndicator> createState() => _TabStateIndicatorView();
}

class _TabStateIndicatorView extends State<_TabIndicator> {
  late TabController? controller =
      widget.controller ?? DefaultTabController.of(context);

  int get selectedIndex => controller?.index ?? -1;
  bool get isSelected => selectedIndex == widget.index;

  void onTabChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    controller?.addListener(onTabChanged);

    var theme = Theme.of(context);
    final tabColor = isSelected ? theme.primaryColor : Colors.blueGrey;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          widget.icon,
          color: tabColor,
        ),
        const SizedBox(width: 8),
        Text(
          widget.title,
          style: TextStyle(color: tabColor),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller?.removeListener(onTabChanged);
    super.dispose();
  }
}
