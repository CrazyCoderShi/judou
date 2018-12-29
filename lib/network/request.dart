import 'package:dio/dio.dart';
import './path.dart';
import '../index/models/judou_model.dart';

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
  Future<List<JuDouModel>> request() async {
    Response<Map<String, dynamic>> response = await _dio.get(RequestPath.daily);
    List listData = response.data['data'];
    List transformData =
        listData.where((item) => item['author'] != null).toList();
    List<JuDouModel> judouList =
        transformData.map((item) => JuDouModel.fromJson(item)).toList();
    return judouList;
  }
}
