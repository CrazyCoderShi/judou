import 'package:flutter/material.dart';
import 'package:judou/utils/color_util.dart';

class EndCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          '- END -',
          style: TextStyle(color: ColorUtils.textGreyColor),
        ),
      ),
    );
  }
}
