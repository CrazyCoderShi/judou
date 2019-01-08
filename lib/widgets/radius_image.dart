import 'package:flutter/material.dart';

class RadiusImage extends StatelessWidget {
  RadiusImage({Key key, this.radius, this.imageUrl, this.width, this.height})
      : super(key: key);

  final double radius;
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(this.radius)),
      child: imageUrl == null
          ? Icon(
              Icons.portrait,
              size: width,
            )
          : Image.network(
              this.imageUrl,
              width: this.width,
              height: this.height,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
    );
  }
}
