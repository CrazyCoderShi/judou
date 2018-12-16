import 'package:flutter/material.dart';

class ListCell extends StatelessWidget {
  ListCell({Key key, this.leading, this.title, this.trailing, this.onTap, this.isDivider = false}) : super(key: key);

  final bool isDivider;
  final IconData leading;
  final String title;
  final IconData trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 8),
            child: Row(children: <Widget>[
              Container(
                  child: Icon(this.leading, color: Colors.black54), padding: EdgeInsets.only(left: 15, right: 25)),
              Text(this.title, style: TextStyle(fontSize: 16)),
              Container(
                  child: Icon(this.trailing, color: Colors.black54), padding: EdgeInsets.only(left: 15, right: 15))
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        Divider(color: this.isDivider ? Colors.grey[80] : Colors.transparent, indent: 54)
      ]),
      onTap: this.onTap,
    );
  }
}
