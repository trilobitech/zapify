import 'package:flutter/material.dart';

abstract class TabPage implements Widget {
  IconData get icon;
}

class TabListView extends StatelessWidget {
  const TabListView({Key? key, required this.tabs}) : super(key: key);

  final List<TabPage> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Icon(
                    tab.icon,
                    color: Colors.teal,
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
