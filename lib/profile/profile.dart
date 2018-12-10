import 'package:flutter/material.dart';
import 'package:judou/profile/shopping_list_item.dart';
import 'FavoriteWidget.dart';

class ProfilePage extends StatefulWidget {

  ProfilePage({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Set<Product> _shoppingCart = Set<Product>();

//  void _handleCartChanged(Product product, bool inCart) {
//    setState(() {
//      if (inCart) {
//        _shoppingCart.add(product);
//      } else {
//        _shoppingCart.remove(product);
//      }
//    });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Shopping List')),
//      body: ListView(
//        padding: EdgeInsets.symmetric(vertical: 8.0),
//        children: widget.products.map((Product product) {
//          return ShoppingListItem(
//            product: product,
//            inCart: _shoppingCart.contains(product),
//            onCartChanged: _handleCartChanged
//          );
//        }).toList()
//      ),
//    );
//  }

  // 顶部文字
  Widget titleSection() => Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500])
              )
            ],
          ),
        ),
        FavoriteWidget()
      ],
    ),
  );

  // 构建icon + text的button
  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: color)
          )
        )
      ],
    );
  }

  Widget buttonSection() => Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButtonColumn(Icons.call, 'CALL'),
        buildButtonColumn(Icons.near_me, 'ROUTE'),
        buildButtonColumn(Icons.share, 'SHARE')
      ],
    )
  );

  // 文字描述部分
  Widget textSection() => Container(
    padding: const EdgeInsets.all(32.0),
    child: Text(
      '''
      Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
      ''',
      softWrap: true
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hopes')),
      body: ListView(
        children: <Widget>[
          Image.asset(
              'lib/assets/shine_bg.jpg',
              width: MediaQuery.of(context).size.width,
              height: 240,
              fit: BoxFit.cover
          ),
          titleSection(),
          buttonSection(),
          textSection()
        ],
      ),
    );
  }
}