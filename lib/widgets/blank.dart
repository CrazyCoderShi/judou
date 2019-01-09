import 'package:flutter/material.dart';
import '../utils/color_util.dart';

class Blank extends StatelessWidget {
  Blank({Key key, this.height = 10, this.color = ColorUtils.blankColor})
      : super(key: key);

  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Container(color: color),
    );
  }
}
