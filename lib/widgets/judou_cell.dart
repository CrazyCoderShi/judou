import 'package:flutter/material.dart';
import '../widgets/radius_image.dart';
import '../utils/color_util.dart';
import '../widgets/image_preview.dart';
import 'package:page_transition/page_transition.dart';
import '../index/models/judou_model.dart';
import '../utils/date_util.dart';

class JuDouCell extends StatelessWidget {
  JuDouCell({Key key, this.divider, this.tag, this.model, this.onTap})
      : super(key: key);

  final Widget divider;
  // 每一个tag必须是唯一的
  final String tag;
  final VoidCallback onTap;
  final JuDouModel model;

  // 顶部作者信息
  Widget authorInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                RadiusImage(
                    radius: 3.0,
                    imageUrl: model.author.coverUrl,
                    width: 30,
                    height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    model.author.name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: ColorUtils.textUserNameColor),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: model.author.isVerified
                        ? Icon(Icons.stars, size: 16, color: Colors.blue)
                        : Container()),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null),
        ],
      );

  // 中间大图
  Widget midImage(BuildContext context) => Hero(
        tag: this.tag,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: RadiusImage(
              imageUrl: model.pictures[0].url,
              width: MediaQuery.of(context).size.width,
              height: 200,
              radius: 8.0),
        ),
      );

  // 大图预览
  void toImagePreview(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: ImagePreview(
          imageUrl:
              'http://judou.b0.upaiyun.com/image/crawler/2017/12/02/86df66633a544a1b850d19333d4a4721.jpg',
          tag: this.tag,
        ),
      ),
    );
  }

  // 收录者信息
  Widget referenceAuthorInfo() => Row(
        children: <Widget>[
          RadiusImage(
              imageUrl: model.user.avatar, width: 20, height: 20, radius: 10),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(model.user.nickname, style: TextStyle(fontSize: 10))),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '${DateUtils.fromNow(int.parse(model.publishedDate))}收录',
              style: TextStyle(fontSize: 10, color: ColorUtils.textGreyColor),
            ),
          ),
        ],
      );

  // 最底部一排icon
  Widget bottomBtns() {
    /// 左侧icon，右侧文字，文字参数可选
    /// iconData -> Icons.favorite_border
    /// onTap -> 点击回调
    /// rightTitle -> 可选参数，如果有传，右侧会显示一个文字
    Widget btn(IconData iconData, VoidCallback onTap, [String rightTitle]) =>
        GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(iconData, color: ColorUtils.textUserNameColor),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Text(
                    rightTitle ?? '',
                    style: TextStyle(
                        color: ColorUtils.textUserNameColor, fontSize: 10),
                  ),
                )
              ],
            ),
            onTap: onTap);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        btn(Icons.favorite_border, () => print('11111'), '${model.likeCount}'),
        btn(Icons.insert_comment, null, '${model.commentCount}'),
        btn(Icons.bookmark_border, null),
        btn(Icons.share, null)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              authorInfo(),
              Text(
                model.content,
                style: TextStyle(
                    color: ColorUtils.textPrimaryColor,
                    fontSize: 14,
                    height: 1.2),
              ),
              GestureDetector(
                child: midImage(context),
                onTap: () => this.toImagePreview(context),
              ),
              referenceAuthorInfo(),
              Divider(color: ColorUtils.dividerColor),
              bottomBtns()
            ],
          ),
          color: Colors.white,
        ),
        divider,
      ]),
      onTap: this.onTap,
    );
  }
}
