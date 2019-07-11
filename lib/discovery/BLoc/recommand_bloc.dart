import 'dart:async';
import '../../network/network.dart';
import '../models/post_model.dart';
import '../models/video_model.dart';
import '../models/subject_model.dart';
import '../models/carousel_model.dart';
import '../../index/models/judou_model.dart';

class RecommandBloc implements BlocBase {
  final _fetchSubject = PublishSubject<Map<String, dynamic>>();

  RecommandBloc() {
    _fetchData();
  }

  Stream<Map<String, dynamic>> get stream => _fetchSubject.stream;

  void _fetchData() async {
    // 推荐
    Map<String, dynamic> recommands = await Request.instance.dio
        .get(RequestPath.recommand())
        .then((response) => response.data)
        .then((response) {
      List l1 = response['posts'] as List;
      List l2 = response['subjects'] as List;
      List l3 = response['videos'] as List;

      List<PostModel> posts =
          l1.map((item) => PostModel.fromJSON(item)).toList();
      List<SubjectModel> subjects =
          l2.map((item) => SubjectModel.fromJSON(item)).toList();
      List<VideoModel> videos =
          l3.map((item) => VideoModel.fromJSON(item)).toList();
      return {'posts': posts, 'subjects': subjects, 'videos': videos};
    });
    // 轮播
    List<CarouselModel> carousels = await Request.instance.dio
        .get(RequestPath.carousels())
        .then((response) => response.data)
        .then((response) => response['data'] as List)
        .then((response) =>
            response.map((item) => CarouselModel.fromJSON(item)).toList());

    // 今日哲思
    List<JuDouModel> today = await Request.instance.dio
        .get(RequestPath.todayThink())
        .then((response) => response.data)
        .then((response) => response['data'] as List)
        .then((response) =>
            response.map((item) => JuDouModel.fromJson(item)).toList());

    /// 最后的所有数据组装完毕
    /// posts -> List<PostModel>
    /// subjects -> List<SubjectModel>
    /// videos -> List<VideoModel>
    /// carousels -> List<CarouselModel>
    recommands.addAll({'carousels': carousels, 'today': today});
    if (!_fetchSubject.isClosed) {
      _fetchSubject.sink.add(recommands);
    }
  }

  @override
  dispose() {
    if (!_fetchSubject.isClosed) {
      _fetchSubject.close();
    }
  }
}
