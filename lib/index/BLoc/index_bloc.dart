import 'package:rxdart/rxdart.dart';
import '../../bloc_provider.dart';
import '../models/judou_model.dart';
import '../../network/request.dart';

class IndexBloc implements BlocBase {
  IndexBloc() {
    _readDailyJson();
  }

  final _fetchDaily = PublishSubject<List<JuDouModel>>();
  Stream<List<JuDouModel>> get dailyStream => _fetchDaily.stream;

  @override
  dispose() {
    if (!_fetchDaily.isClosed) _fetchDaily.close();
  }

  void _readDailyJson() async {
    List<JuDouModel> list = await Request.instance.request();
    _fetchDaily.sink.add(list);
  }
}
