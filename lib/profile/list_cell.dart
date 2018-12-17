import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
              Row(
                children: <Widget>[
                  Container(
                      child: Icon(this.leading, color: Theme.of(context).accentColor), padding: EdgeInsets.only(left: 15, right: 15)),
                  Text(this.title, style: TextStyle(fontSize: 16)),
                ],
              ),
              Container(
                  child: Icon(this.trailing, color: Theme.of(context).dividerColor, size: 16), padding: EdgeInsets.only(left: 15, right: 15))
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        Divider(color: this.isDivider ? Theme.of(context).dividerColor : Colors.transparent, indent: 54)
      ]),
      onTap: this.onTap,
    );
  }
}
