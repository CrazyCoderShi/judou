import '../widgets/blank.dart';
import './user_info_tile.dart';
import '../utils/color_util.dart';
import '../widgets/radius_image.dart';
import '../widgets/image_preview.dart';
import 'package:flutter/material.dart';
import '../index/pages/detail_page.dart';
import '../index/models/judou_model.dart';
import '../profile/pages/profile_detail.dart';
import 'package:page_transition/page_transition.dart';

class JuDouCell extends StatefulWidget {
  JuDouCell({
    Key key,
    this.divider,
    this.tag,
    this.model,
    this.isCell = true,
  }) : super(key: key);

  final Widget divider;
  // 每一个tag必须是唯一的
  final String tag;
  final JuDouModel model;

  /// 如果是作为Cell时content文字只显示三行
  final bool isCell;

  @override
  _JuDouCellState createState() => _JuDouCellState();
}

class _JuDouCellState extends State<JuDouCell> with SingleTickerProviderStateMixin {
  JuDouModel model;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    controller = AnimationController(vsync: this, value: 1.0);
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

  // 中间大图
  Widget _midImage(BuildContext context) => Hero(
        tag: widget.tag,
        transitionOnUserGestures: true,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: RadiusImage(
            imageUrl: model.pictures[0].url,
            width: MediaQuery.of(context).size.width,
            height: 200,
            radius: 8.0,
          ),
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
              _AuthorInfo(model: model, moreAction: _moreAction),
              Text(
                model.content,
                style: TextStyle(color: ColorUtils.textPrimaryColor, fontSize: 14, height: 1.2),
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
              _ReferenceAuthorInfo(model: model),
              Divider(color: ColorUtils.dividerColor),
              _BottomButtonRow(model: model, commentAction: _toDetailPage)
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

/// 顶部作者信息
class _AuthorInfo extends StatelessWidget {
  _AuthorInfo({Key key, this.model, this.moreAction}) : super(key: key);

  final JuDouModel model;
  final VoidCallback moreAction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: GestureDetector(
            child: Row(
              children: <Widget>[
                RadiusImage(
                    radius: 3.0,
                    imageUrl: model.author != null ? model.author.coverUrl : model.user.avatar ?? '',
                    width: 30,
                    height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    model.author != null ? model.author.name : model.user.nickname,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: ColorUtils.textUserNameColor),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: (model.author != null ? model.author.isVerified : false)
                        ? Icon(Icons.stars, size: 16, color: Colors.blue)
                        : Container()),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProfileDetailPage(type: 1, id: '${model.author.id ?? model.user.uid}')),
              );
            },
          ),
        ),
        IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: moreAction),
      ],
    );
  }
}

/// 收录者信息
class _ReferenceAuthorInfo extends StatelessWidget {
  _ReferenceAuthorInfo({Key key, this.model}) : super(key: key);

  final JuDouModel model;
  @override
  Widget build(BuildContext context) {
    return model.user != null
        ? UserInfoTile(
            avatar: model.user.avatar,
            name: model.user.nickname,
            trailName: '收录',
          )
        : Container();
  }
}

/// 最底部一排icon
class _BottomButtonRow extends StatelessWidget {
  _BottomButtonRow({Key key, this.model, this.commentAction}) : super(key: key);

  final JuDouModel model;
  final VoidCallback commentAction;

  Widget btn(IconData iconData, VoidCallback onTap, [String rightTitle]) => GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, color: ColorUtils.textUserNameColor),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Text(
                rightTitle ?? '',
                style: TextStyle(color: ColorUtils.textUserNameColor, fontSize: 10),
              ),
            )
          ],
        ),
        onTap: onTap,
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        btn(Icons.favorite_border, () => print('11111'), '${model.likeCount}'),
        btn(Icons.insert_comment, commentAction, '${model.commentCount}'),
        btn(Icons.bookmark_border, null),
        btn(Icons.share, null)
      ],
    );
  }
}
