import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited)
        _favoriteCount -= 1;
      else
        _favoriteCount += 1;

      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
              onPressed: _toggleFavorite,
              color: Colors.red[500]
          ),
        ),
        SizedBox(width: 18.0, child: Container(child: Text('$_favoriteCount')))
      ]
    );
  }
}