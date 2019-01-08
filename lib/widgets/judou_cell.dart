import '../widgets/blank.dart';
import '../utils/color_util.dart';
import '../widgets/radius_image.dart';
import '../widgets/image_preview.dart';
import 'package:flutter/material.dart';
import '../index/pages/detail_page.dart';
import '../index/models/judou_model.dart';
import 'package:page_transition/page_transition.dart';

class JuDouCell extends StatefulWidget {
  JuDouCell({
    Key key,
    this.divider,
    this.tag,
    this.model,
    this.onTap,
    this.isCell = true,
  }) : super(key: key);

  final Widget divider;
  // 每一个tag必须是唯一的
  final String tag;
  final VoidCallback onTap;
  final JuDouModel model;

  /// 如果是作为Cell时content文字只显示三行
  final bool isCell;

  @override
  _JuDouCellState createState() => _JuDouCellState();
}

class _JuDouCellState extends State<JuDouCell>
    with SingleTickerProviderStateMixin {
  JuDouModel model;
  AnimationController controller;

  @override
  void initState() {
    model = widget.model;
    controller = AnimationController(vsync: this, value: 1.0);
    super.initState();
  }

  // 点击右侧下箭头
  void _moreAction() {
    showModalBottomSheet(
      context: context,
      builder: (builder) => SafeArea(
            child: Container(
              color: Colors.white,
              height: 101,
              child: Column(
                children: <Widget>[
                  FlatButton(child: Text('复制'), onPressed: () => print('复制')),
                  Blank(height: 5),
                  FlatButton(child: Text('取消'), onPressed: () => print('取消')),
                ],
              ),
            ),
          ),
    );
  }

  // 顶部作者信息
  Widget _authorInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                RadiusImage(
                    radius: 3.0,
                    imageUrl: model.author != null
                        ? model.author.coverUrl
                        : model.user.avatar,
                    width: 30,
                    height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    model.author != null
                        ? model.author.name
                        : model.user.nickname,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: ColorUtils.textUserNameColor),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:
                        (model.author != null ? model.author.isVerified : false)
                            ? Icon(Icons.stars, size: 16, color: Colors.blue)
                            : Container()),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.keyboard_arrow_down), onPressed: _moreAction),
        ],
      );

  // 中间大图
  Widget _midImage(BuildContext context) => Hero(
        tag: widget.tag,
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
  void _toImagePreview(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: ImagePreview(
          imageUrl: model.pictures[0].url,
          tag: widget.tag,
        ),
      ),
    );
  }

  // 收录者信息
  Widget _referenceAuthorInfo() => model.author != null
      ? Row(
          children: <Widget>[
            RadiusImage(
                imageUrl: model.user.avatar, width: 20, height: 20, radius: 10),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child:
                    Text(model.user.nickname, style: TextStyle(fontSize: 10))),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '收录',
                style: TextStyle(fontSize: 10, color: ColorUtils.textGreyColor),
              ),
            ),
          ],
        )
      : Container();

  // 最底部一排icon
  Widget _bottomBtns() {
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
        btn(Icons.insert_comment, this._toDetailPage, '${model.commentCount}'),
        btn(Icons.bookmark_border, null),
        btn(Icons.share, null)
      ],
    );
  }

  void _toDetailPage() {
    if (!widget.isCell) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(model: model),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _authorInfo(),
              Text(
                model.content,
                style: TextStyle(
                    color: ColorUtils.textPrimaryColor,
                    fontSize: 14,
                    height: 1.2),
                maxLines: widget.isCell ? 4 : 999,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              model.pictures.isNotEmpty
                  ? GestureDetector(
                      child: _midImage(context),
                      onTap: () => _toImagePreview(context),
                    )
                  : Container(height: 10),
              _referenceAuthorInfo(),
              Divider(color: ColorUtils.dividerColor),
              _bottomBtns()
            ],
          ),
          color: Colors.white,
        ),
        widget.divider,
      ]),
      onTap: _toDetailPage,
    );
  }
}
