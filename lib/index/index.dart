import 'package:flutter/material.dart';
import 'item_page.dart';
import 'detail_page.dart';
import 'package:judou/widgets/button_subscript.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final PageController _pageController = PageController();

  void detailPageDispose() {}

  void _toDetailPage() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(onDispose: detailPageDispose)));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  void _handlePageScroll(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {

    }
  }

  void _onPageChanged(index) {
    print(index);
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
            ]),
        body: NotificationListener<ScrollNotification>(
          child: PageView.builder(
            itemBuilder: (context, index) {
              return IndexPageItem(onTap: _toDetailPage);
            },
            itemCount: 3,
            controller: this._pageController,
            onPageChanged: (index) => this._onPageChanged(index)
          ),
          onNotification: (ScrollNotification notification) {
            _handlePageScroll(notification);
          },
        ));
  }
}
