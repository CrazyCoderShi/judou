import 'package:flutter/material.dart';
import 'package:judou/utils/color_util.dart';
import 'package:judou/widgets/blank.dart';

class DetailLabel extends StatelessWidget {
  DetailLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorUtils.dividerColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  shape: BoxShape.rectangle),
              child: Text('爱情', style: TextStyle(color: ColorUtils.textGreyColor, fontSize: 14)))
        ]),
        Blank()
      ],
    );
  }
}
