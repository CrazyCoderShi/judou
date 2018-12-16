import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key key }) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
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
        title: TextField(
          textInputAction: TextInputAction.search,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '🔍 搜索你喜欢的内容'
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          indicatorColor: Colors.red,
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