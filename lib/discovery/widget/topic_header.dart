// 话题列表页header
import 'dart:ui';
import '../../utils/ui_util.dart';
import '../../widgets/blank.dart';
import 'package:flutter/material.dart';

class TopicsHeader extends StatelessWidget {
  TopicsHeader({this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final sreenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle(double size) {
      return TextStyle(
          color: Colors.black,
          fontSize: size,
          fontWeight: FontWeight.w300,
          letterSpacing: 1);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: sreenWidth,
          height: DeviceUtils.iPhoneXAbove(context) ? 190 : 170,
          child: Image.network(
            data['cover'],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data['name'],
                style: textStyle(16),
                textAlign: TextAlign.left,
              ),
              Text(
                data['description'],
                style: textStyle(13),
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Blank()
      ],
    );
  }
}
