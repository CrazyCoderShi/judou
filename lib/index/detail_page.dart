
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, @required this.onDispose});
  final VoidCallback onDispose;

  @override
  State<StatefulWidget> createState() {
    return _DetailStateful();
  }
}

class _DetailStateful extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(),
      )
    );
  }
}