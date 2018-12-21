import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {

  DetailHeader({Key key}) : super(key: key);

  Widget userInfo() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        child: Text('11111'),
      ),
      Icon(Icons.keyboard_arrow_down)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          userInfo()
        ],
      ),
      color: Colors.white,
    );
  }
}