import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({Key key, this.imageUrl, this.tag}) : super(key: key);

  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Hero(
              tag: this.tag,
              child: GestureDetector(
                  child: Image.network(this.imageUrl),
                  onTap: () => Navigator.pop(context)),
              transitionOnUserGestures: true)),
    );
  }
}
