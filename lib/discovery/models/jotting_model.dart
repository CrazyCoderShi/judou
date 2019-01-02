class JuttingModel {
  final String summary;
  final int id;
  final String author;
  final int hits;
  final String publishedAt;
  final String uuid;
  final String title;
  final String url;
  final String banner;
  final bool isShowBanner;

  JuttingModel(
      {this.summary,
      this.id,
      this.author,
      this.hits,
      this.publishedAt,
      this.uuid,
      this.title,
      this.url,
      this.banner,
      this.isShowBanner});

  factory JuttingModel.fromJSON(Map<String, dynamic> json) {
    return JuttingModel(
      summary: json['summary'] as String,
      id: json['id'] as int,
      author: json['author'] as String,
      hits: json['hits'] as int,
      publishedAt: json['published_at'] as String,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      banner: json['banner'] as String,
      isShowBanner: json['is_show_banner'] as bool,
    );
  }
}
