import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../utils/color_util.dart';

class ListCell extends StatelessWidget {
  ListCell(
      {Key key,
      this.leading,
      this.title,
      this.trailing,
      this.onTap,
      this.isDivider = false})
      : super(key: key);

  final bool isDivider;
  final IconData leading;
  final String title;
  final IconData trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(this.leading, color: ColorUtils.iconColor),
                        padding: EdgeInsets.only(left: 15, right: 15),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(this.trailing,
                        color: ColorUtils.dividerColor, size: 16),
                    padding: EdgeInsets.only(left: 15, right: 15),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Divider(
              color:
                  this.isDivider ? ColorUtils.dividerColor : Colors.transparent,
              indent: 54,
              height: 1,
            )
          ],
        ),
        color: Colors.white,
      ),
      onTap: this.onTap,
    );
  }
}
