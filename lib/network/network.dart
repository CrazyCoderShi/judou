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
    'signature': 'd6bd6be70568da10da55d64a73f37dec',
    'system_version': '12.1',
    'timestamp': '${DateTime.now().millisecondsSinceEpoch}',
    'token': '249d880e4ba539c6edc04f9e35ff46a3',
    'version': '3.5.7',
    'version_code': '41'
  });

  Future request() async {
    _dio.get('path', data: _data);
  }
}
