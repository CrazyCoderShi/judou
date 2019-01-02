class TopicModel {
  final String summary;
  final int id;
  final String shareUrl;
  final String title;
  final String uuid;
  final String cover;
  final int attendeesCount;
  final String publishedAt;
  final int commentsCount;

  TopicModel(
      {this.summary,
      this.id,
      this.shareUrl,
      this.title,
      this.uuid,
      this.cover,
      this.attendeesCount,
      this.publishedAt,
      this.commentsCount});

  factory TopicModel.fromJSON(Map<String, dynamic> json) {
    return TopicModel(
        summary: json['summary'] as String,
        id: json['id'] as int,
        shareUrl: json['share_url'] as String,
        title: json['title'] as String,
        uuid: json['uuid'] as String,
        cover: json['cover'] as String,
        attendeesCount: json['attendees_count'] as int,
        publishedAt: json['published_at'] as String,
        commentsCount: json['comments_count'] as int);
  }
}
