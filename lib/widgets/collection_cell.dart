import 'package:flutter/material.dart';
import './radius_image.dart';
import '../profile/models/collections_model.dart';

class CollectionCell extends StatelessWidget {
  CollectionCell({
    Key key,
    this.model,
  }) : super(key: key);

  final CollectionModel model;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: width,
            height: width,
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 10),
              child: RadiusImage(
                imageUrl: model.cover,
                radius: 5,
                width: width - 30,
                height: width - 30,
              ),
            ),
          ),
          Center(
            child: Text(
              model.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
