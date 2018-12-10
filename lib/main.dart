import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:judou/index/index.dart';
import 'package:judou/discovery/search.dart';
import 'package:judou/profile/profile.dart';
import 'package:judou/profile/shopping_list_item.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    IndexPage(),
    DiscoveryPage(),
    ProfilePage(products: <Product>[
      Product(name: 'Eggs'),
      Product(name: 'Flour'),
      Product(name: 'Chocolate chips')
    ])
  ];

  void _onItemTapped (int index) {
    debugPrint('$index');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.refresh), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Descovery')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.orange,
          onTap: _onItemTapped,
        )
      );
    }
}
