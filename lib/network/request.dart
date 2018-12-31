import 'package:dio/dio.dart';
import './path.dart';
import '../index/models/judou_model.dart';
import '../index/models/comment_model.dart';

class Request {
  /// instance
  static final Request _request = Request._internal();
  Request._internal();
  static Request get instance => _request;

  /// Dio通用配置
  /// baseUrl -> https://judouapp.com/api
  /// connectTimeout
  /// receiveTimeout
  ///
  final Dio _dio = Dio(
    Options(
      baseUrl: 'https://judouapp.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.JSON,
    ),
  );

  /// 请求首页数据
  Future<List<JuDouModel>> daily() async {
    Response<Map<String, dynamic>> response = await _dio.get(RequestPath.daily);
    List listData = response.data['data'];
    List transformData =
        listData.where((item) => item['author'] != null).toList();
    List<JuDouModel> judouList =
        transformData.map((item) => JuDouModel.fromJson(item)).toList();
    return judouList;
  }

  /// 每个句子的详情
  Future<JuDouModel> sentence(String uuid) async {
    Response<Map<String, dynamic>> response =
        await _dio.get(RequestPath.sentence(uuid));
    Map<String, dynamic> data = response.data['data'];
    return JuDouModel.fromJson(data);
  }

  /// 每个句子的热评
  /// 每个句子的最新评论
  Future<Map<String, List<CommentModel>>> sentenceHot(String uuid) async {
    Response<Map<String, dynamic>> hotResponse =
        await _dio.get(RequestPath.sentenceHot(uuid));
    Response<Map<String, dynamic>> latestResponse =
        await _dio.get(RequestPath.sentenceLatest(uuid));
    List hot = hotResponse.data['data'];
    List latest = latestResponse.data['data'];
    List<CommentModel> hotList =
        hot.map((item) => CommentModel.fromJSON(item)).toList();
    List<CommentModel> latesList =
        latest.map((item) => CommentModel.fromJSON(item)).toList();
    return {'hot': hotList, 'latest': latesList};
  }
}
