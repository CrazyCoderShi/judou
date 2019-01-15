// 普通用户Profile
import 'dart:ui';
import '../../widgets/blank.dart';
import '../../utils/ui_util.dart';
import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';

class NormalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sreenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle(double size) {
      return TextStyle(
          color: Colors.white, fontSize: size, fontWeight: FontWeight.w300);
    }

    return Stack(
      children: <Widget>[
        SizedBox(
          width: sreenWidth,
          height: DeviceUtils.iPhoneXAbove(context) ? 286 : 264,
          child: Image.network(
            'https://judou.oss-cn-beijing.aliyuncs.com/images/author/2019/1/9/5ajgw7fmt4.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: DeviceUtils.iPhoneXAbove(context) ? 286 : 264,
            width: sreenWidth,
            color: Colors.black.withOpacity(0.4),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: RadiusImage(
                      imageUrl:
                          'https://judou.oss-cn-beijing.aliyuncs.com/images/author/2019/1/9/5ajgw7fmt4.jpeg',
                      width: 70,
                      height: 70,
                      radius: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('天南', style: textStyle(16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('关注 0 | 粉丝 888', style: textStyle(12)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 24,
                    width: 100,
                    child: Center(
                      child: Text(
                        '关注',
                        style: textStyle(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
