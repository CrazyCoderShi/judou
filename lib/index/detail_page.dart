
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailStateful();
  }
}

class _DetailStateful extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage'), centerTitle: true),
      body: Center(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)))
    );
  }
}