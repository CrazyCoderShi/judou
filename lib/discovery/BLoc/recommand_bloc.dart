import '../../network/network.dart';

class RecommandBloc implements BlocBase {
  final _fetchSubject = PublishSubject<Map<String, dynamic>>();

  RecommandBloc() {
    _fetchData();
  }

  void _fetchData() {}

  @override
  dispose() {
    if (!_fetchSubject.isClosed) {
      _fetchSubject.close();
    }
  }
}
