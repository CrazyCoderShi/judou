import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:judou/widgets/custom_appbar.dart';

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
        leading: IconButton(icon: Icon(Icons.add_a_photo, color: Colors.white,), onPressed: null),
        actions: <Widget>[new IconButton(icon: Icon(Icons.today), onPressed: _toDetailPage)]
      ),
      body: Center(child: Text('Index Body'))
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child: Column(
//        children: <Widget>[
//          CustomAppBar(
//            title: Text('CustomAppBar', style: TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
//            onPress: _toDetailPage,
//          ),
//          Expanded(
//            child: Center(child: Text('Hello World!'))
//          )
//        ]
//      )
//    );
//  }
}
