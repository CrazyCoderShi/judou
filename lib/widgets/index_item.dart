import 'package:flutter/material.dart';
import '../index/models/judou_model.dart';
import '../widgets/vertical_text.dart';

class IndexPageItem extends StatefulWidget {
  IndexPageItem({Key key, this.onTap, this.model}) : super(key: key);

  final VoidCallback onTap;
  final JuDouModel model;

  @override
  _IndexPageItemState createState() => _IndexPageItemState();
}

class _IndexPageItemState extends State<IndexPageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // 字体设置
  TextStyle textStyle(double fontSize, bool isSpace) => TextStyle(
        fontSize: fontSize,
        fontFamily: 'PingFang',
        fontWeight: FontWeight.w200,
        letterSpacing: isSpace ? 1 : 0,
      );

  Widget verticalText(String text, double rightPosition) => Positioned(
        child: Container(
          padding: EdgeInsets.only(left: 2),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.white, width: 0.5)),
          ),
          child: VerticalText(
            text: text,
            color: Colors.white,
            size: 10,
          ),
        ),
        top: 10,
        right: rightPosition + 10,
      );

  // 顶部大图部分
  Stack headerView() => Stack(
        children: <Widget>[
          SizedBox(
            child: Image.network(widget.model.pictures[0].url,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 260,
                gaplessPlayback: true),
          ),
          Positioned(
            child: Text(widget.model.day,
                style: TextStyle(fontSize: 99, color: Colors.white)),
            bottom: -50,
            left: 20,
          ),
          verticalText('戊戌狗年', 15),
          verticalText('甲子月庚寅日', 35),
          verticalText('冬月十八', 55)
        ],
      );

  // 文章和作者部分
  Container contentView() => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.model.content,
                style: textStyle(17, true), textAlign: TextAlign.start),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(widget.model.subHeading,
                      style: textStyle(17, true), textAlign: TextAlign.end),
                )
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          headerView(),
          Expanded(
            child: Stack(
              children: <Widget>[
                SizedBox(child: contentView()),
                Positioned(
                    child: Text(widget.model.day,
                        style: TextStyle(fontSize: 99, color: Colors.black)),
                    top: -70,
                    left: 20),
                Positioned(
                    child: Text(widget.model.dailyDate,
                        style: textStyle(12, false), textAlign: TextAlign.end),
                    right: 20,
                    top: 5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
