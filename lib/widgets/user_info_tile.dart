import './radius_image.dart';
import '../utils/color_util.dart';
import 'package:flutter/material.dart';

class UserInfoTile extends StatelessWidget {
  UserInfoTile({
    @required this.avatar,
    @required this.name,
    @required this.trailName,
  });

  final String avatar;
  final String name;
  final String trailName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RadiusImage(
          imageUrl: avatar,
          width: 20,
          height: 20,
          radius: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            name,
            style: TextStyle(fontSize: 10),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            trailName,
            style: TextStyle(fontSize: 10, color: ColorUtils.textGreyColor),
          ),
        ),
      ],
    );
  }
}
