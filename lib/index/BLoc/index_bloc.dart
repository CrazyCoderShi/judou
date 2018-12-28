import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import './bloc_provider.dart';

class IndexBloc implements BlocBase {
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
