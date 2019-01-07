class RequestPath {
  /// 首页接口地址
  static const String daily =
      '/v6/op/sentences/daily?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=45&platform=ios&signature=6d52830af89222da917a0161d3d32c70&system_version=12.1&timestamp=1546019663&token=249d880e4ba539c6edc04f9e35ff46a3&version=3.5.7&version_code=41';

  /// 句子详情
  /// [uuid] 句子id
  static String sentence(String uuid) {
    return '/v6/op/sentences/$uuid?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=5351b762de0d27b2c2db3c4eebdaca41&system_version=12.1&timestamp=1546215975&token=249d880e4ba539c6edc04f9e35ff46a3&version=3.5.7&version_code=41';
  }

  /// 句子热评
  static String sentenceHot(String uuid) {
    return '/v6/op/sentences/$uuid/comments/hot?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=78bffaeb4feeebdd5427dd810bc11e3d&system_version=12.1&timestamp=1546215975&token=249d880e4ba539c6edc04f9e35ff46a3&version=3.5.7&version_code=41';
  }

  /// 最新评论
  static String sentenceLatest(String uuid) {
    return '/v6/op/sentences/$uuid/comments/latest?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=78bffaeb4feeebdd5427dd810bc11e3d&system_version=12.1&timestamp=1546215975&token=249d880e4ba539c6edc04f9e35ff46a3&version=3.5.7&version_code=41';
  }

  /// 所有频道id + title
  static String channels() {
    return '/v6/op/discovery/channels?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=9949b7b650b2c283fb9c69bc25275786&system_version=12.1.2&timestamp=1546392267&version=3.5.7&version_code=41';
  }

  /// 每个子频道的数据
  /// 12 -> 订阅
  static String channelWithId(String id) {
    return '/v6/op/channels/$id?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=0e443b5733c1fe43b83dec0d70491904&system_version=12.1.2&timestamp=1546793077&token=5fbeffff6f6d92c4902139d2619852b0&version=3.6.1&version_code=44';
  }
}
