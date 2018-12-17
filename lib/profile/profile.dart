import 'package:flutter/material.dart';
import 'list_cell.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 头像 + 昵称
  Widget header() => Container(
      padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 25),
      child: Row(children: <Widget>[
        Container(
            child: CircleAvatar(backgroundColor: Colors.orange, radius: 40),
            padding: EdgeInsets.only(left: 15, right: 15)),
        Column(
          children: <Widget>[
            Text(
              '庸者的救赎',
              style: Theme.of(context).textTheme.title,
            ),
            GestureDetector(child: Text('点击查看个人主页', style: TextStyle(fontSize: 14, color: Colors.black26)))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ]));

  // 留白
  Widget blank(double height) => SizedBox(
    width: MediaQuery.of(context).size.width,
    height: height,
    child: Container(
      color: Colors.grey[100]
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: ListView(children: <Widget>[
              header(),
              blank(10),
              ListCell(
                title: '我的收藏',
                leading: Icons.collections,
                trailing: Icons.arrow_forward_ios,
                isDivider: true,
                onTap: () => debugPrint('点击'),
              )
            ]),
            top: true
        )
    );
  }
}
