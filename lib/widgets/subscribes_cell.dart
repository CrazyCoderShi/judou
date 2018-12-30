import 'package:flutter/material.dart';
import '../widgets/radius_image.dart';
import '../utils/color_util.dart';

class SubscribesCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          RadiusImage(
            imageUrl:
                'http:\/\/judou.b0.upaiyun.com\/avatar\/2018\/04\/2E9998D6-7BC8-4D1A-B2D2-77B2D664910A.JPG',
            radius: 3.0,
            width: 60,
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '薛之谦',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorUtils.textPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Icon(
                        Icons.stars,
                        size: 16,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width - 98,
                  child: Text(
                    '华语流行乐男歌手，影视演员，音乐制作人，代表作品认真的雪、演员、丑八怪 || 华语流行乐男歌手，影视演员，音乐制作人，代表作品认真的雪、演员、丑八怪',
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorUtils.textGreyColor,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
