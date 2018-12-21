import 'package:flutter/material.dart';
import 'package:judou/utils/color_util.dart';

class SubscriptButton extends StatefulWidget {
  SubscriptButton({
    Key key,
    @required this.icon,
    this.color = ColorUtils.iconColor,
    @required this.subscript,
    this.onPressed
  }) : super(key: key);

  final Icon icon;
  final Color color;
  final String subscript;
  final VoidCallback onPressed;

  @override
  _SubscriptButtonState createState() => _SubscriptButtonState();
}

class _SubscriptButtonState extends State<SubscriptButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        SizedBox(
          child: Container(
            padding: EdgeInsets.only(top: 5, right: 5),
            child: IconButton(icon: widget.icon, onPressed: widget.onPressed, color: widget.color)
          )
        ),
        Positioned(
          top: 12,
          child: Text(widget.subscript, style: TextStyle(fontSize: 10, color: widget.color, fontFamily: 'PingFang'), textAlign: TextAlign.left)
        )
      ],
    );
  }
}