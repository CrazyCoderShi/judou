// "id": 124,
// "uuid": "3e18be3f-3994-4e51-a3ee-f26955fc40c0",
// "title": "哪一句话，让你突然就放弃Ta了？",
// "summary": "你有没有喜欢过一个人，很久很久，以为自己会一直坚持下去，结果却在多年后的某一天，因为Ta或者别人的一句话，你就突然释怀了，选择了放弃。谁都懂坚持的甜蜜，但不是谁能理解放手的心酸。",
// "attendees_count": 488,
// "comments_count": 318,
// "published_at": "2019-01-07T00:00:00.000+08:00",
// "share_url": "http://m.judouapp.com/subjects/124",
// "cover": "https://judou.oss-cn-beijing.aliyuncs.com/images/subject/2019/1/2/inx9nz81.jpeg",
// "hits": 8

class SubjectModel {
  final int id;
  final String title;
  final String uuid;
  final int attendeesCount;
  final int commentsCount;
  final String summary;
  final String cover;
  final int hits;
  final String shareUrl;
  final String publishedAt;

  SubjectModel({
    this.id,
    this.title,
    this.uuid,
    this.attendeesCount,
    this.commentsCount,
    this.summary,
    this.cover,
    this.hits,
    this.shareUrl,
    this.publishedAt,
  });

  factory SubjectModel.fromJSON(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      title: json['title'],
      uuid: json['uuid'],
      attendeesCount: json['attendees_count'],
      commentsCount: json['comments_count'],
      summary: json['summary'],
      cover: json['cover'],
      hits: json['hits'],
      shareUrl: json['share_url'],
      publishedAt: json['published_at'],
    );
  }
}
