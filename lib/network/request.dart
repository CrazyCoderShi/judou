import 'package:dio/dio.dart';

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
  final Dio dio = Dio(
    Options(
      baseUrl: 'https://judouapp.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.JSON,
    ),
  );
}
