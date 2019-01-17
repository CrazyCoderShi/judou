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

  /// 发现页面
  /// 推荐轮播
  static String carousels() {
    return '/v5/recommends/carousels?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=39acb567bf5b1792f58b58ff46ad6003&system_version=12.1.2&timestamp=1547011818&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// 发现页面
  /// 今日哲思考
  static String todayThink() {
    return '/v5/recommends/today?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=39acb567bf5b1792f58b58ff46ad6003&system_version=12.1.2&timestamp=1547011818&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// 发现页面
  /// 三段list数据
  /// posts
  /// subjects
  /// videos
  static String recommand() {
    return '/v5/recommends?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=39acb567bf5b1792f58b58ff46ad6003&system_version=12.1.2&timestamp=1547011818&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Author Info
  static String authorInfo(String id) {
    return '/v6/op/authors/$id?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=a00f384c42d33a23334baef74690628b&system_version=12.1.2&timestamp=1547494083&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Author Sentences Latest
  static String authorInfoLatest(String id) {
    return '/v6/op/authors/$id/sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&order_by=latest&page=1&per_page=20&platform=ios&signature=e53538fc8afbeee370c06f4ac9e88862&system_version=12.1.2&timestamp=1547494908&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Author Sentences Hot
  static String authorInfoHot(String id) {
    return '/v6/op/authors/$id/sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&order_by=hot&page=1&per_page=20&platform=ios&signature=b93170717513bd9ea3aba395911fb740&system_version=12.1.2&timestamp=1547494915&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Topics info
  static String topicsInfo(String uuid) {
    return '/v5/topics/$uuid?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=816ca877b7a4f8ebae64fc5fbd2cf81f&system_version=12.1.2&timestamp=1547497222&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Topics Latest
  static String topicsInfoLatest(String uuid) {
    return '/v5/topics/$uuid/sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=6c86664041fa6268b446f716cc0d84be&system_version=12.1.2&timestamp=1547497222&token=8783e97df8f4a954663a0674fb38ffe0&type=latest&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// Topics Hot
  static String topicsInfoHot(String uuid) {
    return '/v5/topics/$uuid/sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=8131b95f324e83bde06ecd60d7511966&system_version=12.1.2&timestamp=1547497366&token=8783e97df8f4a954663a0674fb38ffe0&type=hot&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// User
  static String userInfo(String uid) {
    return '/v5/users/$uid?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&platform=ios&signature=34e8a31d21c37d78557486df1e4aa07a&system_version=12.1.2&timestamp=1547669808&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// User Sentences
  static String userInfoSentences(String uid) {
    return '/v6/op/users/$uid/sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=0d73839987a308ebfa7019f071968b05&system_version=12.1.2&timestamp=1547669808&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }

  /// ProfileDetail
  /// User Collections
  static String userInfoCollections(String uid) {
    return '/v6/op/users/$uid/collections?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=9f5e19d3dd08667400da31ae0e045e1b&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=b4fdc33ea9ac41325261a7ccf2a4dbc1&system_version=12.1.2&timestamp=1547497622&token=8783e97df8f4a954663a0674fb38ffe0&version=3.6.1&version_code=44';
  }
}
