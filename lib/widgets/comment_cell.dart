import 'package:flutter/material.dart';
import '../widgets/radius_image.dart';
import '../index/models/comment_model.dart';
import '../utils/color_util.dart';
import '../utils/date_util.dart';
import '../profile/pages/profile_detail.dart';

class CommentCell extends StatelessWidget {
  CommentCell({Key key, @required this.divider, this.model}) : super(key: key);

  final Widget divider;
  final CommentModel model;

  @override
  Widget build(BuildContext context) {
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
    return Container(
      padding: EdgeInsets.only(left: 15),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _UserInfo(model: model),
          Padding(
            padding: EdgeInsets.only(
                left: 35,
                right: 15,
                bottom: model.replyToComment.isEmpty ? 0 : 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                commentContent(),
                model.replyToComment.isEmpty
                    ? Container()
                    : _ReplyContent(
                        replyModel: CommentModel.fromJSON(model.replyToComment),
                      ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35),
            child: divider,
          ),
        ],
      ),
    );
  }
}

// 点赞及数字
class _UpCount extends StatelessWidget {
  _UpCount({this.isLiked, this.countStr});

  final bool isLiked;
  final String countStr;

  @override
  Widget build(BuildContext context) {
    var color = isLiked ? Colors.black : ColorUtils.textGreyColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          countStr,
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
}

// user-info
class _UserInfo extends StatelessWidget {
  _UserInfo({this.model});

  final CommentModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      ProfileDetailPage(type: 0, id: '${model.user.uid}'))),
          child: Row(
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
        ),
        _UpCount(isLiked: model.isLiked, countStr: '${model.upCount}'),
      ],
    );
  }
}

// 回复引用
class _ReplyContent extends StatelessWidget {
  _ReplyContent({this.replyModel});
  final CommentModel replyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 999,
      padding: EdgeInsets.all(8),
      color: ColorUtils.blankColor,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${replyModel.user.nickname}:',
              style: TextStyle(
                color: ColorUtils.textGreyColor,
                fontSize: 12,
                height: 1.2,
              ),
            ),
            TextSpan(
              text: replyModel.content,
              style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  color: ColorUtils.textPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
