import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:judou/widgets/button_subscript.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  void detailPageDispose() {

  }

  void _toDetailPage() async {
    final result = await Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => DetailPage(onDispose: detailPageDispose))
    );

    Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
  }

  TextStyle textStyle (double fontSize, bool isSpace) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'PingFang',
        fontWeight: FontWeight.w200,
        letterSpacing: isSpace ? 1 : 0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        centerTitle: true,
        leading: Container(
          alignment: Alignment.center,
          child: Text('句子', style: TextStyle(fontSize: 22.0, fontFamily: 'LiSung')),
        ),
        actions: <Widget>[
          SubscriptButton(icon: Icon(Icons.message), subscript: '95'),
          SubscriptButton(icon: Icon(Icons.favorite_border), subscript: '1k'),
          IconButton(icon: Icon(Icons.share, color: Theme.of(context).accentColor), onPressed: _toDetailPage)
        ]
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                child: Image.network('https://file.juzimi.com/weibopic/jrzami2.jpg'),
              ),
              Positioned(child: Text('14', style: TextStyle(fontSize: 99, color: Colors.white)), bottom: -43, left: 20)
            ],
          ),
          Expanded(child: Stack(
            children: <Widget>[
              SizedBox(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('曾静在某一瞬间, 我们都以为自己长大了。'
                          '但是有一天，我们终于发现，长大的含义除了欲望还有勇气、责任、坚强以及某种必须的牺牲。'
                          '在生活面前们还都是孩子们，其实我们从未长大，还不懂爱和被爱。', 
                          style: textStyle(16, true)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('与青春有关的日子', style: textStyle(16, true))
                        ]
                      )
                    ],
                  )
                )
              ),
              Positioned(child: Text('14', style: TextStyle(fontSize: 99, color: Colors.black)), top: -75, left: 20),
              Positioned(child: Text('2018.12 星期六', style: textStyle(12, false)), right: 20, top: 5)
            ],
          ))
        ],
      )
    );
  }
}
