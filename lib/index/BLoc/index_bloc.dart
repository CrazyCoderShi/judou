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
  JuDouModel model = JuDouModel();
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
    model = _dataList[index];
    double l = model.likeCount / 1000;
    double c = model.commentCount / 1000;
    String likeNum =
        (l > 1) ? l.toStringAsFixed(1) + 'k' : '${model.likeCount}';
    String commentNum =
        (c > 1) ? c.toStringAsFixed(1) : '${model.commentCount}';
    _badges.sink.add([commentNum, likeNum, model.isLiked ? '1' : '0']);
  }

  /// to detail page
  void toDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(model: model)),
    );
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
