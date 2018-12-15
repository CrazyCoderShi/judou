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
                child: Image.network('https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg'),
              ),
              Positioned(child: Text('14', style: TextStyle(fontSize: 99, color: Colors.white)), bottom: -43, left: 20)
            ],
          ),
          Expanded(child: Stack(
            children: <Widget>[
              SizedBox(
                child: Container(),
              ),
              Positioned(child: Text('14', style: TextStyle(fontSize: 99, color: Colors.black)), top: -75, left: 20)
            ],
          ))
        ],
      )
    );
  }
}
