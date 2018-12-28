import 'package:dio/dio.dart';
import './path.dart';

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
        receiveTimeout: 3000),
  );

  Future<Response> request() => _dio.get(RequestPath.daily);
}
