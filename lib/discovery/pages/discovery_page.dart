import './include_page.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/subscribe_widget.dart';
import '../widget/recommand_widget.dart';
import '../widget/discovery_widget.dart';
import 'package:page_transition/page_transition.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _topController;
  List<Tab> tabs = [Tab(text: '订阅'), Tab(text: '发现'), Tab(text: '推荐')];

  @override
  void initState() {
    _topController = TabController(vsync: this, length: 3);
    _topController.index = 1;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _topController.dispose();
    super.dispose();
  }

  void _toIncludePage() {
    Navigator.of(context).push(PageTransition(
      type: PageTransitionType.downToUp,
      child: IncludePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          controller: _topController,
          tabs: tabs,
          indicatorColor: Colors.yellow,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: ColorUtils.textGreyColor,
          labelStyle: TextStyle(fontSize: 16),
          labelPadding: EdgeInsets.symmetric(horizontal: 4),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('搜索'),
          ),
        ],
      ),
      body: TabBarView(
        controller: _topController,
        children: <Widget>[
          DiscoverySubscribe(),
          Discovery(),
          DiscoveryRecommand()
        ],
      ),
      floatingActionButton: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorUtils.textPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: _toIncludePage,
        ),
      ),
    );
  }
}
