import 'package:flutter/material.dart';
import './index/pages/index_page.dart';
import './discovery/pages/discovery_page.dart';
import './profile/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static IndexPage _indexPage = IndexPage();
  static DiscoveryPage _discoveryPage = DiscoveryPage();
  static ProfilePage _profilePage = ProfilePage();
  final _pages = [_indexPage, _discoveryPage, _profilePage];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: _selectedIndex == 0
                  ? Icon(Icons.autorenew)
                  : Icon(Icons.adjust),
              onPressed: () => this._onItemTapped(0),
            ),
            IconButton(
              icon: _selectedIndex == 1
                  ? Icon(Icons.explore)
                  : ImageIcon(AssetImage('assets/descovery.png')),
              onPressed: () => this._onItemTapped(1),
            ),
            IconButton(
              icon: _selectedIndex == 2
                  ? Icon(Icons.person)
                  : Icon(Icons.person_outline),
              onPressed: () => this._onItemTapped(2),
            )
          ],
        ),
      ),
    );
  }
}
