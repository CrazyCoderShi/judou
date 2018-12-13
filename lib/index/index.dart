import 'package:flutter/material.dart';
import 'detail_page.dart';

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
        title: Text('Home', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        leading: Text('句读', textAlign: TextAlign.center),
        actions: <Widget>[new IconButton(icon: Icon(Icons.today), onPressed: _toDetailPage)]
      ),
      body: Center(child: Text('Index Body'))
    );
  }
}
