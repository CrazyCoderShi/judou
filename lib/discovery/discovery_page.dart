import '../bloc_provider.dart';
import '../widgets/blank.dart';
import '../utils/color_util.dart';
import './BLoc/discovery_bloc.dart';
import '../widgets/judou_cell.dart';
import '../widgets/jottings_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../index/pages/detail_page.dart';
import './BLoc/discovery_bloc.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: DiscoveryWidget(),
      bloc: DiscoveryBloc(),
    );
  }
}

class DiscoveryWidget extends StatefulWidget {
  @override
  _DiscoveryWidgetState createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<Tab> myTabs;
  DiscoveryBloc discoveryBloc;
  TabController _tabController;

  @override
  void initState() {
    discoveryBloc = BlocProvider.of<DiscoveryBloc>(context);
    discoveryBloc.tabSubject.listen((tabs) {
      setState(() {
        myTabs = tabs.map((item) => Tab(text: item.name)).toList();
        _tabController = TabController(vsync: this, length: myTabs.length);
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

  // placeholder的样式问题，已经在官方版本里面修复了
  // 这里暂时tricky一下，😂
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoTextField(
          placeholder: '                                     🔍搜索你喜欢的内容',
          textAlign: TextAlign.center,
          decoration: BoxDecoration(
            color: ColorUtils.dividerColor,
            border: Border.all(color: Colors.transparent),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
          ),
          style: TextStyle(
              height: 1, fontSize: 16, color: ColorUtils.textGreyColor),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          isScrollable: true,
          indicatorColor: Colors.black26,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: myTabs.isNotEmpty
          ? TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    // if (tab.text == '随笔') {
                    return JottingsCell();
                    // }

                    // return JuDouCell(
                    //   divider: Blank(),
                    //   tag: 'discovery_detail$index',
                    //   onTap: this.toDetailPage,
                    // );
                  },
                  itemCount: 20,
                );
              }).toList(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
