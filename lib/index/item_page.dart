import 'package:flutter/material.dart';
import 'data/juzi_model.dart';

class IndexPageItem extends StatefulWidget {
  IndexPageItem({Key key, this.onTap, this.model}) : super(key: key);

  final VoidCallback onTap;
  final JuDouModel model;

  @override
  _IndexPageItemState createState() => _IndexPageItemState();
}

class _IndexPageItemState extends State<IndexPageItem> {
  // 字体设置
  TextStyle textStyle(double fontSize, bool isSpace) => TextStyle(
        fontSize: fontSize,
        fontFamily: 'PingFang',
        fontWeight: FontWeight.w300,
        letterSpacing: isSpace ? 1 : 0,
      );

  // 顶部大图部分
  Stack headerView() => Stack(
        children: <Widget>[
          SizedBox(
            child: Image.network(widget.model.pictures[0].url,
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: 260, gaplessPlayback: true),
          ),
          Positioned(
              child: Text(widget.model.day, style: TextStyle(fontSize: 99, color: Colors.white)), bottom: -50, left: 20)
        ],
      );

  // 文章和作者部分
  Container contentView() => Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.model.content, style: textStyle(17, true), textAlign: TextAlign.start),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(widget.model.subHeading, style: textStyle(17, true), textAlign: TextAlign.end))
          ])
        ],
      ));

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
                  child: Text(widget.model.day, style: TextStyle(fontSize: 99, color: Colors.black)),
                  top: -70,
                  left: 20),
              Positioned(
                  child: Text(widget.model.dailyDate, style: textStyle(12, false), textAlign: TextAlign.end),
                  right: 20,
                  top: 5)
            ],
          ))
        ],
      ),
    );
  }
}
