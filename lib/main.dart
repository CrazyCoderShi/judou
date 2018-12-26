import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(JuDouApp());
}

/// TODO： List
/// 网络请求: dio -> https://github.com/flutterchina/dio
class JuDouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
