import './discovery_card.dart';
import '../../widgets/blank.dart';
import 'package:flutter/material.dart';

class DiscoveryWidget extends StatefulWidget {
  @override
  _DiscoveryWidgetState createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Tab> tabs = [
    Tab(text: '亲情'),
    Tab(text: '友情'),
    Tab(text: '励志'),
    Tab(text: '鸡汤'),
    Tab(text: '其他')
  ];

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            height: 136,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: ((context, index) => Container(
                  width: 120,
                  height: 120,
                  color: index == 2 ? Colors.red : Colors.blue)),
            ),
          ),
          Blank(height: 5),
          TabBar(
            controller: _controller,
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: tabs
                  .map((item) => ListView.builder(
                        itemBuilder: (context, inde) => Container(
                              color: Colors.red,
                              height: 30,
                              width: MediaQuery.of(context).size.width - 30,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Text('${item.text}'),
                            ),
                        itemCount: 30,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
