import '../models/topic_model.dart';
import '../../network/network.dart';
import '../../index/models/tag_model.dart';
import '../../index/models/judou_model.dart';

class DiscoveryBloc implements BlocBase {
  final _discoverySubject = PublishSubject<Map<String, dynamic>>();

  DiscoveryBloc() {
    _fetchData();
  }

  /// 获取tab标题相关数据
  /// 整个方法已经在最新的版本中废弃
  // void _fetchTitle() async {
  //   List<TabModel> tabs = await Request.instance.dio
  //       .get(RequestPath.channels())
  //       .then((response) => response.data['data'] as List)
  //       .then((response) =>
  //           response.map((item) => TabModel.fromJSON(item)).toList());
  //   tabSubject.sink.add(tabs);
  // }

  Stream<Map<String, dynamic>> get stream => _discoverySubject.stream;

  /// 拉取当前页面的数据, 并进行组装, 最终返回的是一个Map<String, dynamic>
  /// topics -> 话题数据
  /// tags -> 中间tag标题
  /// tagListData -> 某一个tag的数据
  void _fetchData() async {
    List<TopicModel> topics = await Request.instance.dio
        .get(RequestPath.topicData())
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => TopicModel.fromJSON(item)).toList());

    List<TagModel> tags = await Request.instance.dio
        .get(RequestPath.discoveryTags())
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => TagModel.fromJSON(item)).toList());

    List<JuDouModel> tagListData =
        await _fetchTagListDataWithId('${tags[0].id}');

    Map<String, dynamic> map = {
      'topics': topics,
      'tags': tags,
      'tagListData': tagListData
    };

    _discoverySubject.sink.add(map);
  }

  /// 根据[id]获取某个tag下的数据
  /// [id] -> tagId
  Future<List<JuDouModel>> _fetchTagListDataWithId(String id) async {
    List<JuDouModel> tagListData = await Request.instance.dio
        .get(RequestPath.dataWithTagId(id))
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());
    return tagListData;
  }

  @override
  dispose() {
    if (!_discoverySubject.isClosed) _discoverySubject.close();
  }
}
