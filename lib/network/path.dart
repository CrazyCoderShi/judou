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
    return '/v6/op/channels/12?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=d9dc0c50e7d7d95b9b4b7457633fb1d0&system_version=12.1.2&timestamp=1546828665&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// 发现页面
  /// 底部Tags
  static String discoveryTags() {
    return '/v5/tags/list?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=75f4b199a5ed71b7bb9c85679839ae7d&system_version=12.1.2&timestamp=1546822867&version=3.6.1&version_code=44';
  }

  /// 发现页面
  /// 话题数据
  static String topicData() {
    return '/v5/topics?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=75f4b199a5ed71b7bb9c85679839ae7d&system_version=12.1.2&timestamp=1546822867&version=3.6.1&version_code=44';
  }

  /// 发现页面
  /// 根据Tag id获取数据
  /// [id] tag id
  static String dataWithTagId(String id) {
    return '/v5/tags/$id/ordered_sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=af6b8753c7eed7177746f0b326de350d&system_version=12.1.2&timestamp=1546822893&token=5fbeffff6f6d92c4902139d2619852b0&version=3.6.1&version_code=44';
  }
}
