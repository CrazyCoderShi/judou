import 'package:dio/dio.dart';

class Network {
  /// instance
  static final Network _network = Network._internal();
  Network._internal();
  static Network get instance => _network;

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

  /// 公共参数
  final _data = FormData.from({
    'app_key': 'af66b896-665e-415c-a119-6ca5233a6963',
    'channel': 'App Store',
    'device_id': '9f5e19d3dd08667400da31ae0e045e1b',
    'device_type': 'iPhone9,1',
    'page': '1',
    'per_page': '45',
    'platform': 'ios',
    'signature': '05654bd16823fd49674c2087623013f7',
    'system_version': '12.1',
    'timestamp': '1545803977',
    'token': '249d880e4ba539c6edc04f9e35ff46a3',
    'version': '3.5.7',
    'version_code': '41'
  });

  Future<Response> request() => _dio.get(
      '/v6/op/sentences/ab5d5de0-6631-48ad-82c5-c9a056ae8d82/comments/hot?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=0f88b2a68f9d78005d64d808a5f35574&system_version=12.1&timestamp=1545804890&token=249d880e4ba539c6edc04f9e35ff46a3&version=3.5.7&version_code=41');
}
