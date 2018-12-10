
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
  void dispose() {
    super.dispose();
    debugPrint('已经死了');
  }

  void onPressBtn() {
    widget.onDispose();
    Navigator.pop(context, '回来的数据');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage'), centerTitle: true),
      body: Center(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: onPressBtn))
    );
  }
}