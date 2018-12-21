import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({Key key, this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Hero(
              tag: 'detail_image',
              child: GestureDetector(child: Image.network(this.imageUrl), onTap: () => Navigator.pop(context)),
              transitionOnUserGestures: true)),
    );
  }
}
