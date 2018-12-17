import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'CENTER'),
    Tab(text: 'RIGHT')
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CupertinoTextField(placeholder: '搜索你喜欢的内容', textAlign: TextAlign.center),
          bottom: TabBar(
              controller: _tabController,
              tabs: myTabs,
              indicatorColor: Colors.black26,
              indicatorSize: TabBarIndicatorSize.label
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: myTabs.map((Tab tab) {
              return Center(child: Text(tab.text));
            }).toList()
        )
    );
  }
}