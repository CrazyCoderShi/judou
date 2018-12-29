import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../../bloc_provider.dart';
import '../models/judou_model.dart';

class IndexBloc implements BlocBase {
  IndexBloc() {
    // _readDailyJson();
  }

  final _fetchDaily = PublishSubject<JuDouModel>();
  Stream<JuDouModel> get dailyStream => _fetchDaily.stream;

  @override
  dispose() {
    if (!_fetchDaily.isClosed) _fetchDaily.close();
  }

  // // 读取json数据
  // Future<String> _readDailyJson() async {
  //   String contents;
  //   try {
  //     contents = await DefaultAssetBundle.of().loadString('json/daily.json');
  //   } catch (e) {
  //     print(e);
  //   }

  //   return contents;
  // }
}
