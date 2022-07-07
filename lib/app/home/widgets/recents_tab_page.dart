import 'package:flutter/material.dart';
import 'package:zapfy/app/home/widgets/tabs.dart';

class RecentsTabPage extends StatelessWidget implements TabPage {
  const RecentsTabPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.history;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Empty history'),
    );
  }
}
