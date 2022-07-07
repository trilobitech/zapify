import 'package:flutter/material.dart';
import 'package:zapfy/app/home/widgets/tabs.dart';

class CallLogTabPage extends StatelessWidget implements TabPage {
  const CallLogTabPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.call;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Empty history'),
    );
  }
}