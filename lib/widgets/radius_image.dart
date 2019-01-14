import 'package:flutter/material.dart';

class RadiusImage extends StatelessWidget {
  RadiusImage({
    Key key,
    this.radius,
    @required this.imageUrl,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double radius;
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(this.radius ?? 0)),
      child: imageUrl == null || imageUrl == ''
          ? Image(
              image: AssetImage('assets/avatar_placeholder.png'),
              width: this.width,
              height: this.height,
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
