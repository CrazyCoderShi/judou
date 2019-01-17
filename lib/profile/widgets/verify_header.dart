// 认证用户的Profile
import 'dart:ui';
import '../../index/models/user_model.dart';
import '../../utils/ui_util.dart';
import '../../widgets/blank.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';
import '../../widgets/user_info_tile.dart';

class VerfiyHeader extends StatelessWidget {
  VerfiyHeader({this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final sreenWidth = MediaQuery.of(context).size.width;
    UserModel user = UserModel.fromJson(data['user'] ?? Map());
    return Stack(
      children: <Widget>[
        SizedBox(
          width: sreenWidth,
          height: 180,
          child: Image.network(
            data['cover'],
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180,
            width: sreenWidth,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: 160,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '2380人订阅',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: (sreenWidth - 80) / 2,
          child: RadiusImage(
            imageUrl: data['cover'],
            width: 80,
            height: 80,
            radius: 3,
          ),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: DeviceUtils.iPhoneXAbove(context) ? 140 : 110,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['name'],
                      style: TextStyle(fontSize: 13),
                    ),
                    Icon(Icons.stars, size: 16, color: Colors.blue)
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data['description'],
                    style: TextStyle(
                        fontSize: 12, color: ColorUtils.textGreyColor),
                    maxLines: DeviceUtils.iPhoneXAbove(context) ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    data['user'] != null
                        ? UserInfoTile(
                            avatar: user.avatar,
                            name: user.nickname,
                            trailName: '创建',
                          )
                        : Container(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      height: 24,
                      width: 60,
                      child: Center(
                        child: Text(
                          '订阅',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          top: 200,
        ),
        Positioned(
          bottom: 44,
          child: Blank(height: 10),
        )
      ],
    );
  }
}
