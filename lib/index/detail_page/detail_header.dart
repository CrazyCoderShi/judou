import 'package:flutter/material.dart';
import 'package:judou/widgets/avatar.dart';

class DetailHeader extends StatelessWidget {
  DetailHeader({Key key}) : super(key: key);

  Widget userInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Avatar(
                    padding: EdgeInsets.only(right: 10),
                    radius: 3.0,
                    imageUrl:
                        'http://judou.b0.upaiyun.com/uploads/authors/2017/03/923474e8-d751-4d67-9f83-dbfb20c70624.jpg',
                    width: 30,
                    height: 30)
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[userInfo()],
      ),
      color: Colors.white,
    );
  }
}
