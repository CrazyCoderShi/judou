import 'package:flutter/material.dart';
import 'package:judou/widgets/rect_image.dart';
import 'package:judou/utils/color_util.dart';
import 'package:judou/widgets/image_preview.dart';

class DetailHeader extends StatelessWidget {
  DetailHeader({Key key}) : super(key: key);

  // 大图预览
  void toImagePreview(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ImagePreview(imageUrl: 'http://judou.b0.upaiyun.com/image/crawler/2017/12/02/86df66633a544a1b850d19333d4a4721.jpg')));
  }

  // 顶部作者信息
  Widget userInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                RectImage(
                    radius: 3.0,
                    imageUrl:
                        'http://judou.b0.upaiyun.com/uploads/authors/2017/03/923474e8-d751-4d67-9f83-dbfb20c70624.jpg',
                    width: 30,
                    height: 30),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('东野圭吾',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: ColorUtils.textUserNameColor))),
                Padding(padding: EdgeInsets.only(left: 10), child: Icon(Icons.beenhere, size: 15))
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: null)
        ],
      );

  // 中间大图
  Widget midImage(BuildContext context) => Hero(
      tag: 'detail_image',
      child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: RectImage(
              imageUrl: 'http://judou.b0.upaiyun.com/image/crawler/2017/12/02/86df66633a544a1b850d19333d4a4721.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              radius: 8.0)));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          userInfo(),
          Text(
            '生气的人是一个复杂的动物，发出极度矛盾的信息，哀求着救助与关注，然而当这一切到来的时，却又拒绝，希望无须语言就可以得到理解',
            style: TextStyle(color: ColorUtils.textPrimaryColor, fontSize: 14, height: 1.2),
          ),
          GestureDetector(
            child: midImage(context),
            onTap: () => toImagePreview(context),
          ),

        ],
      ),
      color: Colors.white,
    );
  }
}
