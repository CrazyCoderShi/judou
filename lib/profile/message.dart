import 'package:flutter/material.dart';
import 'package:judou/widgets/blank.dart';
import 'package:judou/widgets/list_cell.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('我的消息'),
        actions: <Widget>[
          FlatButton(child: Text('清空'), onPressed: () => debugPrint('消息清空'))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Blank(height: 15),
          ListCell(leading: Icons.alarm, title: '通知', trailing: Icons.arrow_forward_ios, isDivider: true),
          ListCell(leading: Icons.person_add, title: '关注', trailing: Icons.arrow_forward_ios, isDivider: true),
          ListCell(leading: Icons.thumb_up, title: '点赞', trailing: Icons.arrow_forward_ios, isDivider: true),
          ListCell(leading: Icons.message, title: '评论', trailing: Icons.arrow_forward_ios, isDivider: true),
          ListCell(leading: Icons.bookmark_border, title: '收藏', trailing: Icons.arrow_forward_ios),
        ]
      ),
    );
  }
}