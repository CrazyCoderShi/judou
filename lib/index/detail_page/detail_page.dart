import 'package:flutter/material.dart';
import 'package:judou/utils/ui_util.dart';
import 'package:judou/widgets/blank.dart';
import 'package:judou/utils/color_util.dart';
import 'detail_header.dart';
import 'detail_label.dart';
import 'comment_cell.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, @required this.onDispose});
  final VoidCallback onDispose;

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

    Widget endline() => Container(
          color: ColorUtils.blankColor,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text('- END -',
                style: TextStyle(color: ColorUtils.textGreyColor)),
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
                return DetailHeader();
              case 1:
                return DetailLabel();
              case 2:
                return hotCommnets();
              case 98:
                return CommentCell(divider: Container());
              case 99:
                return endline();
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
