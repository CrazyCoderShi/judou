import 'package:flutter/material.dart';
import 'DetailScreen.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Animating')),
        body: Center(child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
            },
            child: Hero(
                tag: 'imageHero',
                child: Image.network('https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg')
            )
        ),)
      )
    );
  }
}