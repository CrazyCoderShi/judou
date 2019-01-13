import 'package:flutter/material.dart';

class ProfilDetail extends StatefulWidget {
  @override
  _ProfilDetailState createState() => _ProfilDetailState();
}

class _ProfilDetailState extends State<ProfilDetail> {
  Color titleColor = Colors.transparent;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        titleColor =
            _controller.offset >= 135 ? Colors.white : Colors.transparent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _controller,
          body: TabBarView(
            children: <Widget>[
              Text('句子'),
              Text('收藏夹'),
            ],
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.red,
                expandedHeight: 240,
                bottom: TabBar(
                  tabs: <Widget>[Tab(text: '句子 1'), Tab(text: '收藏夹 2')],
                ),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                        Text('Reloaded 12 of 576 libraries in 924ms'),
                      ],
                    ),
                  ),
                ),
                title: Text('标题', style: TextStyle(color: titleColor)),
              ),
            ];
          },
        ),
      ),
    );
  }
}
