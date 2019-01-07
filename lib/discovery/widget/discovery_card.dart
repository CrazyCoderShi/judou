import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';

class DiscoveryCard extends StatelessWidget {
  DiscoveryCard({
    Key key,
    this.isLeading,
    this.isTrailing,
  }) : super(key: key);

  final bool isLeading;
  final bool isTrailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.only(left: isLeading ? 15 : 4, right: isTrailing ? 15 : 4),
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: Container(
              width: 100,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
