import 'package:flutter/material.dart';
import '../models/judou_model.dart';
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
  String day = '';
  String dailyDate = '';

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    // 日期转换
    String dayString = widget.model.dailyDate.toString();
    String weekday = '';
    String dailyString = '';
    if (dayString != '' || dailyString != 'null') {
      dailyString = dayString.substring(0, 7).replaceAll(RegExp(r'-'), '.');
      var date = DateTime.parse(widget.model.dailyDate);
      List<String> dayList = ['一', '二', '三', '四', '五', '六', '日'];
      weekday = dayList[date.weekday - 1];
      day = '$date'.substring(8, 10);
      dailyDate = dailyString + '星期' + '$weekday';
    }
  }

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
            child:
                Text(day, style: TextStyle(fontSize: 99, color: Colors.white)),
            bottom: -50,
            left: 20,
          ),
          verticalText('戊戌狗年', 15),
          verticalText('甲子月庚寅日', 35),
          verticalText('腊月甘十八', 55),
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
    super.build(context);
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
                    child: Text(day,
                        style: TextStyle(fontSize: 99, color: Colors.black)),
                    top: -70,
                    left: 20),
                Positioned(
                    child: Text(dailyDate,
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
