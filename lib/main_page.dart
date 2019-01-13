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
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _pages,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 10),
              blurRadius: 10.0,
            ),
          ],
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                icon: _selectedIndex == 0
                    ? Icon(Icons.autorenew)
                    : Icon(Icons.adjust),
              ),
              Tab(
                icon: _selectedIndex == 1
                    ? Icon(Icons.explore)
                    : ImageIcon(AssetImage('assets/descovery.png')),
              ),
              Tab(
                icon: _selectedIndex == 2
                    ? Icon(Icons.person)
                    : Icon(Icons.person_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
