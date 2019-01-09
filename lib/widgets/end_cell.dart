import 'package:flutter/material.dart';
import '../utils/color_util.dart';

class EndCell extends StatelessWidget {
  EndCell({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 50),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          text,
          style: TextStyle(color: ColorUtils.textGreyColor),
        ),
      ),
    );
  }
}
