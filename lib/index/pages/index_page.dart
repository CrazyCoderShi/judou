import 'dart:convert';
import 'detail_page.dart';
import 'package:flutter/material.dart';
import '../../utils/color_util.dart';
import '../../widgets/index_item.dart';
import '../../widgets/button_subscript.dart';
import '../models/judou_model.dart';
import '../BLoc/index_bloc.dart';
import '../../bloc_provider.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: IndexBloc(),
      child: IndexWidget(),
    );
  }
}

class IndexWidget extends StatefulWidget {
  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget>
    with AutomaticKeepAliveClientMixin {
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
          _onPageChanged(_listData[0]); // 初始化第一页
        });
      }
    });
    super.initState();
  }

  // 读取json数据
  Future<String> _readDailyJson() async {
    String contents;
    try {
      contents =
          await DefaultAssetBundle.of(context).loadString('json/daily.json');
    } catch (e) {
      print(e);
    }

    return contents;
  }

  @override
  bool get wantKeepAlive => true;

  // 页面滚动时调用
  void _onPageChanged(JuDouModel model) {
    setState(() {
      double l = model.likeCount / 1000;
      double c = model.commentCount / 1000;
      _likeNum = (l > 1) ? l.toStringAsFixed(1) + 'k' : '${model.likeCount}}';
      _commentNum = (c > 1) ? c.toStringAsFixed(1) : '${model.commentCount}';
    });
  }

  void _toDetailPage() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }

  Widget indexAppBar() => AppBar(
        iconTheme: IconThemeData(color: ColorUtils.iconColor),
        centerTitle: true,
        leading: Container(
          alignment: Alignment.center,
          child: Text('句子',
              style: TextStyle(fontSize: 22.0, fontFamily: 'LiSung')),
        ),
        actions: <Widget>[
          SubscriptButton(icon: Icon(Icons.message), subscript: _commentNum),
          SubscriptButton(
            icon: Icon(
              Icons.favorite_border,
              color:
                  _dataModel.isLiked ? Colors.redAccent : ColorUtils.iconColor,
            ),
            subscript: _likeNum,
          ),
          IconButton(
            icon: Icon(Icons.share, color: ColorUtils.iconColor),
            onPressed: _toDetailPage,
          ),
        ],
      );

  Widget buildBody(AsyncSnapshot<List<JuDouModel>> snapshot) {
    if (snapshot.connectionState != ConnectionState.active) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return PageView.builder(
      itemBuilder: (context, index) {
        return IndexPageItem(onTap: _toDetailPage, model: snapshot.data[index]);
      },
      itemCount: _listData.length,
      controller: this._pageController,
      onPageChanged: (index) => this._onPageChanged(snapshot.data[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final IndexBloc index = BlocProvider.of<IndexBloc>(context);

    return StreamBuilder(
      stream: index.dailyStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<JuDouModel>> snapshot) =>
              Scaffold(
                appBar: indexAppBar(),
                body: buildBody(snapshot),
              ),
    );
  }
}
