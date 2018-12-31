import '../../network/network.dart';
import '../../index/models/judou_model.dart';
import '../../index/models/comment_model.dart';

class DetailBloc implements BlocBase {
  /// 数据流中的类型
  /// Map<String, List<CommentModel>>
  /// {
  ///   "hot": List<CommentModel>,
  ///   "latest": List<CommentModel>
  ///   "detail": JuDouModel
  /// }
  final _fetchComments = PublishSubject<Map<String, dynamic>>();
  final String uuid;

  DetailBloc({this.uuid}) {
    fetchData();
  }

  Stream get commentSteam => _fetchComments.stream;

  void fetchData() async {
    // JuDouModel
    Map<String, dynamic> hot = await sentenceHot(uuid);
    _fetchComments.sink.add(hot);
  }

  @override
  dispose() {
    if (!_fetchComments.isClosed) _fetchComments.close();
  }

  /// 每个句子的热评
  /// 每个句子的最新评论
  /// 每个句子的详情
  Future<Map<String, dynamic>> sentenceHot(String uuid) async {
    List<CommentModel> hot = await Request.instance.dio
        .get(RequestPath.sentenceHot(uuid))
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => CommentModel.fromJSON(item)).toList());
    List<CommentModel> latest = await Request.instance.dio
        .get(RequestPath.sentenceLatest(uuid))
        .then((response) => response.data['data'] as List)
        .then((response) =>
            response.map((item) => CommentModel.fromJSON(item)).toList());
    JuDouModel detailModel = await Request.instance.dio
        .get(RequestPath.sentence(uuid))
        .then((response) => JuDouModel.fromJson(response.data));
    return {'hot': hot, 'latest': latest, 'detail': detailModel};
  }
}
