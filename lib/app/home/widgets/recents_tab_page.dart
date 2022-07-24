import 'package:flutter/material.dart';
import 'package:zapify/app/home/widgets/tabs.dart';

class RecentsTabPage extends StatelessWidget implements TabPage {
  const RecentsTabPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.history;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(
            Icons.whatsapp,
            color: Color(0xFF25d366),
          ),
          title: Text('+5551991165128'),
          trailing: Text('07/07/2022 02:28'),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(Icons.telegram, color: Color(0xFF0088CC)),
          title: Text('+5551991165128'),
          trailing: Text('07/07/2022 02:28'),
        ),
      ],
    );
  }
}
