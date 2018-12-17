import 'package:flutter/material.dart';

class IndexPageItem extends StatefulWidget {
  IndexPageItem({Key key, this.onTap}) : super(key: key);

//  final String content;
//  final String author;
//  final String date;
//  final String imageUrl;
  final VoidCallback onTap;

  @override
  _IndexPageItemState createState() => _IndexPageItemState();
}

class _IndexPageItemState extends State<IndexPageItem> {

  TextStyle textStyle(double fontSize, bool isSpace) => TextStyle(
      fontSize: fontSize,
      fontFamily: 'PingFang',
      fontWeight: FontWeight.w200,
      letterSpacing: isSpace ? 1 : 0
  );

  // 顶部大图部分
  Stack headerView() => Stack(
    children: <Widget>[
      SizedBox(
        child: Image.network('https://file.juzimi.com/weibopic/jxzxmu5.jpg', fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: 300),
      ),
      Positioned(child: Text('18', style: TextStyle(fontSize: 99, color: Colors.white)), bottom: -50, left: 20)
    ],
  );

  // 文章和作者部分
  Container contentView() => Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('曾静在某一瞬间, 我们都以为自己长大了。'
              '但是有一天，我们终于发现，长大的含义除了欲望还有勇气、责任、坚强以及某种必须的牺牲。'
              '在生活面前们还都是孩子们，其实我们从未长大，还不懂爱和被爱。',
              style: textStyle(17, true)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('与青春有关的日子', style: textStyle(17, true))
                )
              ]
          )
        ],
      )
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          headerView(),
          Expanded(child: Stack(
            children: <Widget>[
              SizedBox(child: contentView()),
              Positioned(child: Text('18', style: TextStyle(fontSize: 99, color: Colors.black)), top: -70, left: 20),
              Positioned(child: Text('2018.12 星期六', style: textStyle(12, false)), right: 20, top: 5)
            ],
          ))
        ],
      ),
    );
  }
}