import 'package:flutter/material.dart';
import 'package:judou/widgets/image_avatar.dart';
import 'package:judou/utils/color_util.dart';

class CommentCell extends StatelessWidget {
  CommentCell({Key key, @required this.divider}) : super(key: key);

  final Widget divider;

  @override
  Widget build(BuildContext context) {
    // user-info
    Widget userInfo() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ImageAvatar(
                  width: 30,
                  height: 30,
                  radius: 15,
                  imageUrl:
                      'http://judou.b0.upaiyun.com/uploads/authors/2017/03/923474e8-d751-4d67-9f83-dbfb20c70624.jpg',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '有人说',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        '一分钟前',
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorUtils.textGreyColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: null,
              iconSize: 14,
            ),
          ],
        );

    Widget commentContent() => Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            '生气的人是一个复杂的动物，发出极度矛盾的信息，哀求着救助与关注，然而当这一切到来的时，却又拒绝，希望无须语言就可以得到理解',
            style: TextStyle(
              color: ColorUtils.textPrimaryColor,
              fontSize: 13,
              height: 1.2,
            ),
          ),
        );

    Widget replyContent() => Container(
          padding: EdgeInsets.all(8),
          color: ColorUtils.blankColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '那些花儿:',
                style: TextStyle(
                  color: ColorUtils.textGreyColor,
                  fontSize: 13,
                  height: 1.2,
                ),
              ),
              Text(
                '那些花儿\n真好看\n开出了绚烂的花\n一如年轻时的你',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.2,
                ),
              ),
            ],
          ),
        );
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Column(
              children: <Widget>[
                userInfo(),
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    children: <Widget>[commentContent(), replyContent()],
                  ),
                ),
              ],
            ),
          ),
          divider
        ],
      ),
    );
  }
}
