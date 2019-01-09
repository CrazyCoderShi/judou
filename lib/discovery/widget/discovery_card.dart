import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';
import '../models/topic_model.dart';

class DiscoveryCard extends StatelessWidget {
  DiscoveryCard({Key key, this.isLeading, this.isTrailing, this.model})
      : super(key: key);

  final bool isLeading;
  final bool isTrailing;
  final TopicModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.only(left: isLeading ? 15 : 4, right: isTrailing ? 15 : 4),
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.black26,
                  Colors.black12,
                  Colors.transparent
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              width: 100,
              child: RadiusImage(
                imageUrl: model.cover,
                radius: 3,
                width: 100,
                height: 70,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${model.name}',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
