import 'package:flutter/material.dart';
import 'item_page.dart';
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
      body: PageView(
        children: <Widget>[
          IndexPageItem(onTap: _toDetailPage),
          IndexPageItem(onTap: _toDetailPage)
        ],
      )
    );
  }
}
