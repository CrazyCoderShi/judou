import '../../bloc_provider.dart';
import '../../utils/color_util.dart';
import '../BLoc/discovery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/subscribe_widget.dart';
import '../widget/recommand_widget.dart';
import '../widget/discovery_widget.dart';
import '../../index/pages/detail_page.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: DiscoveryPageWidget(),
      bloc: DiscoveryBloc(),
    );
  }
}

class DiscoveryPageWidget extends StatefulWidget {
  @override
  _DiscoveryPageWidgetState createState() => _DiscoveryPageWidgetState();
}

class _DiscoveryPageWidgetState extends State<DiscoveryPageWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<Tab> myTabs;
  DiscoveryBloc discoveryBloc;
  TabController _tabController;
  List<Tab> tabs = [Tab(text: '订阅'), Tab(text: '发现'), Tab(text: '推荐')];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _tabController.index = 1;
    discoveryBloc = BlocProvider.of<DiscoveryBloc>(context);
    discoveryBloc.tabSubject.listen((tabs) {
      setState(() {
        myTabs = tabs.map((item) => Tab(text: item.name)).toList();
      });
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          controller: _tabController,
          tabs: tabs,
          indicatorColor: Colors.yellow,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: ColorUtils.textGreyColor,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('搜索'),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SubscribeWidget(),
          DiscoveryWidget(),
          RecommandWidget()
        ],
      ),
    );
  }
}
