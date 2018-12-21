import 'package:flutter/material.dart';
import 'package:judou/widgets/list_cell.dart';
import 'message.dart';
import 'package:judou/widgets/blank.dart';
import 'package:judou/utils/color_util.dart';

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
              style: TextStyle(fontSize: 20, fontFamily: 'PingFang'),
            ),
            GestureDetector(child: Text('点击查看个人主页', style: TextStyle(fontSize: 14, color: ColorUtils.textGreyColor)))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ]));

  // 订阅-句子-喜欢
  Widget subscribe() => Container(
    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        columnText('订阅'),
        SizedBox(width: 1, height: 25, child: Container(color: ColorUtils.dividerColor)),
        columnText('句子'),
        SizedBox(width: 1, height: 25, child: Container(color: ColorUtils.dividerColor)),
        columnText('喜欢'),
      ],
    ),
  );

  Widget columnText(String title) => Column(
    children: <Widget>[
      Text('0', style: TextStyle(fontSize: 16)),
      Text(title, style: TextStyle(fontSize: 14, color: ColorUtils.textGreyColor))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: ListView(children: <Widget>[
              header(),
              subscribe(),
              Blank(),
              ListCell(
                title: '我的消息',
                leading: Icons.add_alert,
                trailing: Icons.arrow_forward_ios,
                isDivider: true,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage())),
              ),
              ListCell(
                title: '我的收藏夹',
                leading: Icons.bookmark,
                trailing: Icons.arrow_forward_ios,
                isDivider: true,
                onTap: () => debugPrint('点击'),
              ),
              ListCell(
                title: '我的评论',
                leading: Icons.insert_comment,
                trailing: Icons.arrow_forward_ios,
                onTap: () => debugPrint('点击'),
              ),
              Blank(),
              ListCell(
                title: '常见问题',
                leading: Icons.assistant_photo,
                trailing: Icons.arrow_forward_ios,
                isDivider: true,
                onTap: () => debugPrint('点击'),
              ),
              ListCell(
                title: '我要反馈',
                leading: Icons.feedback,
                trailing: Icons.arrow_forward_ios,
                isDivider: true,
                onTap: () => debugPrint('点击'),
              ),
              ListCell(
                title: '推荐句读',
                leading: Icons.thumb_up,
                trailing: Icons.arrow_forward_ios,
                onTap: () => debugPrint('点击'),
              ),
              Blank(),
              ListCell(
                title: '设置',
                leading: Icons.settings,
                trailing: Icons.arrow_forward_ios,
                onTap: () => debugPrint('点击'),
              ),
              Blank()
            ]),
            top: true
        )
    );
  }
}
