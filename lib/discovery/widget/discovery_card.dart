import 'package:flutter/material.dart';
import '../../widgets/radius_image.dart';

class DiscoveryCard extends StatelessWidget {
  /// TODO: 加入radius_image
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 120,
          height: 120,
          child: Container(color: Colors.red),
        ),
        Positioned(
          child: Text('星星物语'),
        )
      ],
    );
  }
}
