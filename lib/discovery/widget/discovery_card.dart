import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';
import '../../profile/pages/profile_detail.dart';

class DiscoveryCard extends StatelessWidget {
  DiscoveryCard({
    Key key,
    this.isLeading,
    this.isTrailing,
    this.title,
    this.imageUrl,
    this.height,
    this.width,
    this.id,
  }) : super(key: key);

  final bool isLeading;
  final bool isTrailing;
  final String title;
  final String imageUrl;
  final double height;
  final double width;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.only(left: isLeading ? 15 : 4, right: isTrailing ? 15 : 4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            SizedBox(
              child: Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black26,
                      Colors.black12,
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                width: width,
                child: RadiusImage(
                  imageUrl: imageUrl,
                  radius: 3,
                  width: width,
                  height: height,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 84,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProfileDetailPage(type: 2, id: id)),
          );
        },
      ),
    );
  }
}
