import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero')),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
            tag: 'imageHero',
            child: Image.network('https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg')
        ),
      ),
    );
  }
}