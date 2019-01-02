import '../models/tabs_model.dart';
import '../models/topic_model.dart';
import '../../network/network.dart';
import '../models/jotting_model.dart';

class DiscoveryBloc implements BlocBase {
  DiscoveryBloc() {}

  /// 获取tab标题相关数据
  void _fetchTitle() async {
    List<TabModel> tabs = await Request.instance.dio
        .get(RequestPath.channels())
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => TabModel.fromJSON(item)).toList());
  }

  /// 通过id获取某一个频道的数据
  void _fetchDataWithId(TabModel tab) {}

  @override
  dispose() {}
}
