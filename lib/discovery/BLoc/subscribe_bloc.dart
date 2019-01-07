import '../../network/network.dart';
import '../../index/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../index/models/judou_model.dart';

class SubscribeBloc implements BlocBase {
  final _fetchSubject = PublishSubject<List<JuDouModel>>();

  SubscribeBloc() {
    this._fetchData();
  }

  Stream<List<JuDouModel>> get stream => _fetchSubject.stream;

  void _fetchData() async {
    List<JuDouModel> dataList = await Request.instance.dio
        .get(RequestPath.channelWithId('12'))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());
    _fetchSubject.sink.add(dataList);
  }

  /// to detail page
  void toDetailPage(BuildContext context, JuDouModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(model: model)),
    );
  }

  @override
  dispose() {
    if (!_fetchSubject.isClosed) _fetchSubject.close();
  }
}
