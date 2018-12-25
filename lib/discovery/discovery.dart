import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:judou/utils/color_util.dart';
import 'package:judou/widgets/blank.dart';
import 'package:judou/widgets/judou_cell.dart';
import 'package:judou/index/detail_page/detail_page.dart';
import 'package:judou/widgets/jottings_cell.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '推荐'),
    Tab(text: '广场'),
    Tab(text: '原创'),
    Tab(text: '随笔'),
    Tab(text: '励志')
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

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
          indicatorColor: Colors.black26,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (tab.text == '随笔') {
                return JottingsCell();
              }

              return JuDouCell(
                divider: Blank(),
                tag: 'discovery_detail$index',
                onTap: this.toDetailPage,
              );
            },
            itemCount: 20,
          );
        }).toList(),
      ),
    );
  }
}
