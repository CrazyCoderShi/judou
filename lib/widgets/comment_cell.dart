import 'package:flutter/material.dart';
import '../widgets/radius_image.dart';
import '../index/models/comment_model.dart';
import '../utils/color_util.dart';
import '../utils/date_util.dart';

class CommentCell extends StatelessWidget {
  CommentCell({Key key, @required this.divider, this.model}) : super(key: key);

  final Widget divider;
  final CommentModel model;

  @override
  Widget build(BuildContext context) {
    // 点赞及数字
    Widget upCount() {
      var color = model.isLiked ? Colors.black : ColorUtils.textGreyColor;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${model.upCount}',
            style: TextStyle(fontSize: 10, color: color),
            textAlign: TextAlign.end,
          ),
          IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.thumb_up,
              color: color,
            ),
            onPressed: null,
            iconSize: 12,
          ),
        ],
      );
    }

    // user-info
    Widget userInfo() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                RadiusImage(
                  width: 30,
                  height: 30,
                  radius: 15,
                  imageUrl: model.user.avatar,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        model.user.nickname,
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        DateUtils.fromNow(int.parse(model.createdAt)),
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorUtils.textGreyColor,
                        ),
                        softWrap: true,
                        maxLines: 999,
                      )
                    ],
                  ),
                ),
              ],
            ),
            upCount(),
          ],
        );

    Widget commentContent() => Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            model.content,
            style: TextStyle(
              color: ColorUtils.textPrimaryColor,
              fontSize: 13,
              height: 1.2,
            ),
          ),
        );

    Widget replyContent(CommentModel data) => Container(
          width: 999,
          padding: EdgeInsets.all(8),
          color: ColorUtils.blankColor,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${data.user.nickname}:',
                  style: TextStyle(
                    color: ColorUtils.textGreyColor,
                    fontSize: 12,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: data.content,
                  style: TextStyle(
                      fontSize: 12,
                      height: 1.2,
                      color: ColorUtils.textPrimaryColor),
                )
              ],
            ),
          ),
        );
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Column(
          children: <Widget>[
            userInfo(),
            Padding(
              padding: EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  commentContent(),
                  model.replyToComment.isEmpty
                      ? Container()
                      : replyContent(
                          CommentModel.fromJSON(model.replyToComment),
                        ),
                  divider
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
