import 'dart:ui';
import '../widgets/verify_header.dart';
import 'package:flutter/services.dart';
import '../../utils/color_util.dart';
import 'package:flutter/material.dart';
import '../widgets/normal_header.dart';
import '../../discovery/widget/topic_header.dart';

class ProfilDetail extends StatefulWidget {
  @override
  _ProfilDetailState createState() => _ProfilDetailState();
}

class _ProfilDetailState extends State<ProfilDetail> {
  Color _titleColor = Colors.transparent;
  Color _iconColor = Colors.white;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      bool isTop = _controller.offset >= 135;
      setState(() {
        _titleColor = isTop ? Colors.black : Colors.transparent;
        _iconColor = isTop ? Colors.black : Colors.white;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: isTop ? Colors.black : Colors.white,
        ));
      });
    });
  }

  /// verify,topics -> 350
  /// normal -> 286
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
                backgroundColor: Colors.white,
                expandedHeight: 286,
                bottom: TabBar(
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: ColorUtils.textGreyColor,
                  tabs: <Widget>[Tab(text: '句子'), Tab(text: '收藏夹')],
                ),
                iconTheme: IconThemeData(color: _iconColor),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: TopicsHeader(),
                ),
                title: Text('标题', style: TextStyle(color: _titleColor)),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: _iconColor, size: 20),
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              )
            ];
          },
        ),
      ),
    );
  }
}
