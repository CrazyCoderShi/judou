import 'package:flutter/material.dart';

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
          ListTile(title: Text('我的消息'), leading: Icon(Icons.add_alert), trailing: Icon(Icons.arrow_forward_ios)),
          Divider(),
          ListTile(title: Text('我的消息'), leading: Icon(Icons.add_alert), trailing: Icon(Icons.arrow_forward_ios)),
        ],
      )
    );
  }
}