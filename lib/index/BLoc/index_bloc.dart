import 'package:flutter/material.dart';
import '../models/judou_model.dart';
import '../../index/pages/detail_page.dart';
import '../../network/network.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
    _fetchDailyJson();
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
    if (!_badges.isClosed) {
      _badges.sink.add([commentNum, likeNum, model.isLiked ? '1' : '0']);
    }
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

  void _fetchDailyJson() async {
    List<JuDouModel> list = await daily();
    if (!_fetchDaily.isClosed) {
      _fetchDaily.sink.add(list);
    }
    _dataList = list;
    this.onPageChanged(0);
  }

  /// 首页网络请求
  Future<List<JuDouModel>> daily() async {
    List<JuDouModel> list = await Request.instance.dio
        .get(RequestPath.daily)
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    // var dio = Dio();
    // dio.onHttpClientCreate = (HttpClient client) {
    //   client.idleTimeout = Duration(seconds: 1);
    // };

    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;

    // try {
    //   Response response = await dio.download(
    //       'http://flv2.bn.netease.com/videolib3/1707/07/liHAU2643/HD/liHAU2643-mobile.mp4',
    //       '$appDocPath/test.mp4', onProgress: (received, total) {
    //     print('received----- $received  total******** $total');
    //   });
    //   print(response.data);
    // } catch (e) {
    //   print('error -> $e');
    // }

    // print("download succeed!");

    return list;
  }
}
