import 'package:flutter/material.dart';
import '../utils/color_util.dart';

class Label extends StatelessWidget {
  Label(
      {Key key,
      this.title,
      @required this.width,
      @required this.height,
      this.radius,
      this.onTap})
      : super(key: key);

  final double width;
  final double height;
  final double radius;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
          width: this.width,
          height: this.height,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorUtils.textGreyColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(this.radius ?? 0)),
                  shape: BoxShape.rectangle),
              child: Center(
                child: Text(this.title,
                    style: TextStyle(color: Colors.black45, fontSize: 12)),
              ))),
      onTap: this.onTap ?? () => {},
    );
  }
}
