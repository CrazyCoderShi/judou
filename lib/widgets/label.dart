import 'package:flutter/material.dart';
import 'package:judou/utils/color_util.dart';

class Label extends StatelessWidget {
  Label(
      {Key key,
      this.title,
      @required this.width,
      @required this.height,
      this.padding,
      this.radius})
      : super(key: key);

  final double width;
  final double height;
  final double radius;
  final String title;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: this.width,
        height: this.height,
        child: Container(
            padding: this.padding ?? EdgeInsets.all(0),
            decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.dividerColor),
                borderRadius:
                    BorderRadius.all(Radius.circular(this.radius ?? 0)),
                shape: BoxShape.rectangle),
            child: Text('爱情',
                style:
                    TextStyle(color: ColorUtils.textGreyColor, fontSize: 14))));
  }
}
