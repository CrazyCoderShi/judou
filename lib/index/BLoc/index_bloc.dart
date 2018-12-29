import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../../bloc_provider.dart';
import '../models/judou_model.dart';
import '../../network/request.dart';
import '../../index/pages/detail_page.dart';

class IndexBloc implements BlocBase {
  /// 存放所有的model
  final _fetchDaily = PublishSubject<List<JuDouModel>>();

  /// 顶部的角标数据
  /// [0] 评论数
  /// [1] 喜欢数
  /// [2] '1' 喜欢， '0' 不喜欢
  final _badges = PublishSubject<List<String>>();

  List<JuDouModel> _dataList = List<JuDouModel>();

  IndexBloc() {
    _readDailyJson();
  }

  /// JudouModel数据流
  /// 一次性返回
  Stream<List<JuDouModel>> get dailyStream => _fetchDaily.stream;

  /// 角标数据流
  /// 每次发送一个数组，同时包含like和commnet
  Stream<List<String>> get badgesSteam => _badges.stream;

  /// pageview页面切换回调
  void onPageChanged(index) {
    JuDouModel model = _dataList[index];
    _badges.sink
        .add([model.commentCount, model.likeCount, model.isLiked ? '1' : '0']);
  }

  /// to detail page
  void toDetailPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }

  @override
  dispose() {
    if (!_fetchDaily.isClosed) _fetchDaily.close();
    if (!_badges.isClosed) _badges.close();
  }

  void _readDailyJson() async {
    List<JuDouModel> list = await Request.instance.request();
    _fetchDaily.sink.add(list);
    _dataList = list;
    this.onPageChanged(0);
  }
}
