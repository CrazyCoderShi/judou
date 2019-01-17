import '../../bloc_provider.dart';
import '../../network/network.dart';
import '../models/collections_model.dart';
import '../../index/models/judou_model.dart';

class ProfileDetailBloc implements BlocBase {
  int type = 0;
  PublishSubject<Map<String, dynamic>> _dataSubject = PublishSubject();

  /// prfile header wiget type
  /// 0 Normal
  /// 1 Verify
  /// 2 Topics
  ProfileDetailBloc(int type, String id) {
    this.type = type;
    _fetchData(type, id);
  }

  Stream<Map<String, dynamic>> get stream => _dataSubject.stream;

  void _fetchData(int type, String id) async {
    switch (type) {
      case 0:
        {
          _fetchUserInfo(id);
        }
        break;
      case 1:
        {
          _fetchAuthorInfo(id);
        }
        break;
      case 2:
        {
          _fetchTopicsInfo(id);
        }
        break;
    }
  }

  _fetchUserInfo(String uid) async {
    Map<String, dynamic> header = await Request.instance.dio
        .get(RequestPath.userInfo(uid))
        .then((response) => response.data);

    List<JuDouModel> sentences = await Request.instance.dio
        .get(RequestPath.userInfoSentences(uid))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    List<CollectionModel> collections = await Request.instance.dio
        .get(RequestPath.userInfoCollections(uid))
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => CollectionModel.fromJSON(item)).toList());

    _dataSubject.sink.add({
      'header': header,
      'sentences': sentences,
      'collections': collections,
    });
  }

  _fetchAuthorInfo(String uid) async {
    Map<String, dynamic> user = await Request.instance.dio
        .get(RequestPath.authorInfo(uid))
        .then((response) => response.data);

    List<JuDouModel> sentences = await Request.instance.dio
        .get(RequestPath.authorInfoLatest(uid))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    List<JuDouModel> hot = await Request.instance.dio
        .get(RequestPath.authorInfoHot(uid))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    _dataSubject.sink.add({
      'header': user,
      'sentences': sentences,
      'collections': hot,
    });
  }

  _fetchTopicsInfo(String uid) async {
    Map<String, dynamic> user = await Request.instance.dio
        .get(RequestPath.topicsInfo(uid))
        .then((response) => response.data);

    List<JuDouModel> sentences = await Request.instance.dio
        .get(RequestPath.topicsInfoLatest(uid))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    List<JuDouModel> hot = await Request.instance.dio
        .get(RequestPath.topicsInfoHot(uid))
        .then((response) => response.data['data'] as List)
        .then((response) => response.where((item) => !item['is_ad']).toList())
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    _dataSubject.sink.add({
      'header': user,
      'sentences': sentences,
      'collections': hot,
    });
  }

  @override
  dispose() {}
}
