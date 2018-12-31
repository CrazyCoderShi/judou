import '../../bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../../network/request.dart';
import '../models/comment_model.dart';
import '../models/judou_model.dart';
import 'package:dio/dio.dart';

class DetailBloc implements BlocBase {
  final _fetchComments = PublishSubject();
  final String uuid;

  DetailBloc({this.uuid}) {
    fetchData();
  }

  Stream get commentSteam => _fetchComments.stream;

  void fetchData() async {
    // JuDouModel
    Map<String, List<CommentModel>> hot = await Request.instance
        .sentenceHot('679996e4-bb90-4f99-9a39-9f04769e79ac');
  }

  @override
  dispose() {}
}
