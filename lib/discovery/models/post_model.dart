// "id": 547,
// "summary": "我也许感到有一点寂寞，回想我刚才瞥见的这种幸福家庭生活，心里不无艳羡之感。",
// "banner": "https://judou.oss-cn-beijing.aliyuncs.com/images/post/2019/1/7/ablrxblg5.jpeg",
// "author": "毛姆",
// "is_show_banner": true,
// "published_at": "2019-01-09T00:00:00.000+08:00",
// "title": "幸福",
// "url": "https://judouapp.com/p/547",
// "hits": 258,
// "comment_count": 3,
// "like_count": 6,
// "is_liked": false,
// "is_disabled_comment": false

class PostModel {
  final int id;
  final String title;
  final int commentCount;
  final int hits;
  final String author;
  final String summary;
  final String banner;
  final String url;
  final int likeCount;
  final bool isLiked;
  final String publishedAt;

  PostModel({
    this.id,
    this.title,
    this.author,
    this.commentCount,
    this.likeCount,
    this.summary,
    this.banner,
    this.url,
    this.hits,
    this.isLiked,
    this.publishedAt,
  });

  factory PostModel.fromJSON(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      commentCount: json['comment_count'],
      likeCount: json['like_count'],
      summary: json['summary'],
      banner: json['banner'],
      url: json['url'],
      hits: json['hits'],
      isLiked: json['is_liked'],
      publishedAt: json['published_at'],
    );
  }
}
