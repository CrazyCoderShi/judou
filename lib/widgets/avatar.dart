import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key key, this.padding, this.radius, this.imageUrl, this.width, this.height}) : super(key: key);

  final EdgeInsetsGeometry padding;
  final double radius;
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(this.radius)),
      child: Image.network(this.imageUrl, width: this.width, height: this.height)
    );
  }
}
