import 'package:flutter/material.dart';
import 'list_cell.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Hopes')),
        body: Column(
          children: <Widget>[
            ListCell(
              title: '我的收藏',
              leading: Icons.collections,
              trailing: Icons.arrow_forward_ios,
              isDivider: true,
              onTap: () => debugPrint('点击'),
            )

          ],
        ));
  }
}
