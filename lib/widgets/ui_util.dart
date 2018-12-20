import 'package:flutter/material.dart';

class AppBarUtils {
  static AppBar appBar(String title, BuildContext context, [Widget leading, List<Widget> actions]) {
    void backAction() {
      Navigator.pop(context);
    }

    return AppBar(
        title: Text(title,
            style: TextStyle(
                color: Color.fromARGB(255, 45, 45, 45),
                fontWeight: FontWeight.w300,
                fontSize: 18,
                fontFamily: 'PingFang')),
        centerTitle: true,
        leading: leading ??
            IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black54, size: 20), onPressed: backAction),
        actions: actions);
  }
}
