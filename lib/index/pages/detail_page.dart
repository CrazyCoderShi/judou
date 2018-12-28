import 'package:flutter/material.dart';
import '../../utils/ui_util.dart';
import '../../widgets/blank.dart';
import '../../utils/color_util.dart';
import '../../widgets/judou_cell.dart';
import '../../widgets/comment_cell.dart';
import '../../widgets/end_cell.dart';
import '../../widgets/detail_label.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key});

  final items = List<String>.generate(100, (i) => 'item $i');

  @override
  State<StatefulWidget> createState() {
    return _DetailStateful();
  }
}

class _DetailStateful extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget hotCommnets() => Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text('热门评论'),
              ),
              Divider(),
              CommentCell(divider: Container()),
              Blank()
            ],
          ),
        );

    return Scaffold(
      appBar: AppBarUtils.appBar('详情', context),
      backgroundColor: ColorUtils.blankColor,
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return JuDouCell(
                  divider: Blank(),
                  tag: 'index_detail',
                );
              case 1:
                return DetailLabel();
              case 2:
                return hotCommnets();
              case 98:
                return CommentCell(divider: Container());
              case 99:
                return EndCell();
              default:
                return CommentCell(divider: Divider(indent: 50));
            }
          },
          itemCount: widget.items.length,
        ),
      ),
    );
  }
}
