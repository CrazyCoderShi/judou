import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  Blank({Key key, this.height = 10}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width, height: height, child: Container(color: Colors.grey[100]));
  }
}
