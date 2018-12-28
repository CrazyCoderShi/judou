import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:judou/bloc_provider.dart';

class IndexBloc extends BlocBase {
  IndexBloc() {
    fetchDailyData();
  }

  final _fetchDaily = PublishSubject<int>();

  @override
  dispose() {
    if (!_fetchDaily.isClosed) _fetchDaily.close();
  }

  fetchDailyData() async {
    print('fetchDaily');
  }
}
