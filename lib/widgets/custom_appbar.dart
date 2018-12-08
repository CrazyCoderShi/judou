import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.title, this.onPress});

  final Widget title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.fromLTRB(8, 44, 8, 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: this.onPress
          ),
          Expanded(child: title),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: this.onPress
          )
        ],
      ),
    );
  }
}