import 'package:flutter/material.dart';
import '../widgets/blank.dart';
import '../widgets/label.dart';

class DetailLabel extends StatelessWidget {
  DetailLabel({Key key, this.labelTitle}) : super(key: key);

  final String labelTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Label(
                width: 40,
                height: 20,
                radius: 10,
                title: labelTitle,
                onTap: () => print('爱情'),
              ),
            )
          ]),
          Blank()
        ],
      ),
    );
  }
}
