import '../../widgets/blank.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';

final TextStyle _textStyle =
    TextStyle(fontSize: 12, color: ColorUtils.textGreyColor);

class RecommandCell extends StatelessWidget {
  RecommandCell({
    this.isVideo,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.content,
  });

  final bool isVideo;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                RadiusImage(
                  imageUrl: imageUrl,
                  width: 100,
                  height: 70,
                  radius: 0,
                ),
                isVideo
                    ? Positioned(
                        left: 38,
                        top: 23,
                        child: Icon(
                          Icons.play_circle_filled,
                          color: Colors.white54,
                        ))
                    : Container()
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 145,
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 14),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    padding: EdgeInsets.only(bottom: 3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text(
                      '$subTitle 著',
                      style: _textStyle,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    content,
                    style: _textStyle,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        Blank(color: Colors.white, height: 15),
      ],
    );
  }
}
