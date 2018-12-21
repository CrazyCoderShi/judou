import 'package:flutter/material.dart';
import 'item_page.dart';
import 'package:judou/index/detail_page/detail_page.dart';
import 'package:judou/widgets/button_subscript.dart';
import 'dart:convert';
import 'data/juzi_model.dart';
import 'package:judou/utils/color_util.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final PageController _pageController = PageController();
  List<JuDouModel> _listData = List();
  String _likeNum = '';
  String _commentNum = '';
  JuDouModel _dataModel = JuDouModel();

  @override
  void initState() {

    // 读取本地json
    _readDailyJson().then((data) {
      if (data != null) {
        Map<String, dynamic> map = jsonDecode(data);
        List temp = map['data'];
        for (var i in temp) {
          if (i['comment_count'] != 0) {
            _listData.add(JuDouModel.fromJson(i));
          }
        }
        setState(() {
          _onPageChanged(0); // 初始化第一页
        });
      }
    });
    super.initState();
  }

  // 读取json数据
  Future<String> _readDailyJson() async {
    String contents;
    try {
      contents = await DefaultAssetBundle.of(context).loadString('json/daily.json');
    } catch (e) {
      print(e);
    }

    return contents;
  }
  // 初始化每一页的数据
  void _initialPageData(int like, int comment) {
    setState(() {
      double l = _dataModel.likeCount/1000;
      double c = _dataModel.commentCount/1000;
      _likeNum = (l > 1) ? l.toStringAsFixed(1) + 'k' : '$like';
      _commentNum = (c > 1) ? c.toStringAsFixed(1) : '$comment';
    });
  }

  void _handlePageScroll(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {}
  }

  // 页面滚动时调用
  void _onPageChanged(index) {
    _dataModel = _listData[index];
    _initialPageData(_dataModel.likeCount, _dataModel.commentCount);
  }

  void detailPageDispose() {}

  void _toDetailPage() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(onDispose: detailPageDispose)));

//    Scaffold.of(context)
//      ..removeCurrentSnackBar()
//      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: ColorUtils.iconColor),
            centerTitle: true,
            leading: Container(
              alignment: Alignment.center,
              child: Text('句子', style: TextStyle(fontSize: 22.0, fontFamily: 'LiSung')),
            ),
            actions: <Widget>[
              SubscriptButton(icon: Icon(Icons.message), subscript: _commentNum),
              SubscriptButton(icon: Icon(Icons.favorite_border, color: _dataModel.isLiked ? Colors.redAccent : ColorUtils.iconColor), subscript: _likeNum),
              IconButton(icon: Icon(Icons.share, color: ColorUtils.iconColor), onPressed: _toDetailPage)
            ]),
        body: NotificationListener<ScrollNotification>(
          child: PageView.builder(
              itemBuilder: (context, index) {
                return IndexPageItem(onTap: _toDetailPage, model: _dataModel);
              },
              itemCount: _listData.length,
              controller: this._pageController,
              onPageChanged: (index) => this._onPageChanged(index)),
          onNotification: (ScrollNotification notification) {
            _handlePageScroll(notification);
          }
        ));
  }
}
