/// 随笔cell
import 'package:flutter/material.dart';
import '../utils/color_util.dart';

class JottingsCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '等我一年半',
            style: TextStyle(color: ColorUtils.textPrimaryColor, fontSize: 14),
          ),
          Padding(
            child: Text(
              '平日喧闹的告诉公路，在这圣诞之夜出奇地安静，隔着车窗外望，四野一片迷茫',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            padding: EdgeInsets.only(top: 5, bottom: 5),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '天南',
                style: TextStyle(fontSize: 10, color: Colors.brown[200]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Icon(
                  Icons.remove_red_eye,
                  size: 12,
                  color: ColorUtils.textGreyColor,
                ),
              ),
              Text(
                '666',
                style: TextStyle(
                    fontSize: 10, color: ColorUtils.textUserNameColor),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Image.network(
              'https:\/\/judou.oss-cn-beijing.aliyuncs.com\/images\/sentence\/2018\/12\/24\/2ucj7v8q0r.jpeg',
              fit: BoxFit.cover,
              height: 200,
              width: 999,
            ),
          )
        ],
      ),
    );
  }
}
