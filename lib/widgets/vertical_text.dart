import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  VerticalText({Key key, this.text, this.color, this.size}) : super(key: key);

  final double size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          height: 0.85,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
