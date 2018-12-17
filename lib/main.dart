import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:judou/index/index.dart';
import 'package:judou/discovery/search.dart';
import 'package:judou/profile/profile.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(JuDouApp());
}

class JuDouApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black54
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    IndexPage(),
    DiscoveryPage(),
    ProfilePage()
  ];

  void _onItemTapped (int index) {
    debugPrint('$index');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(''), activeIcon: Icon(Icons.autorenew)),
            BottomNavigationBarItem(icon: Icon(Icons.public), title: Text(''), activeIcon: Icon(Icons.explore)),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text(''), activeIcon: Icon(Icons.person))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Theme.of(context).accentColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed
        )
      );
    }
}
