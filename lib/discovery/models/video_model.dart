import '../../index/models/user_model.dart';

// "id": 58,
// "title": "分享才是快乐的意义",
// "source": "",
// "source_link": "",
// "is_published": true,
// "comments_count": 1,
// "likes_count": 0,
// "video_length": 339,
// "summary": "短片中的主人公每天重复着同样的生活，也包括天天买彩票都中头奖。当他明白和他人分享才能获得快乐之前，他已经对于天天中头奖这件事感到厌倦了。你心里的 OS 是不是：他不要放着我来！",
// "cover": "https://judou.oss-cn-beijing.aliyuncs.com/images/video/2019/1/3/1p33xa522u.jpeg",
// "orig_source": "http://video.judouapp.com/sv/33e01ad-16812081b1e/33e01ad-16812081b1e.mp4?auth_key=1547040618-0-0-8a5d82ba60d7a30de4873862930a5814",
// "user": null,
// "share_url": "https://judouapp.com",
// "like_count": 9,
// "is_liked": false
class VideoModel {
  final int id;
  final String title;
  final String source;
  final String sourceLink;
  final bool isPublished;
  final int commentsCount;
  final int likesCount;
  final int videoLength;
  final String summary;
  final String cover;
  final String origSource;
  final String shareUrl;
  final int likeCount;
  final bool isLiked;

  VideoModel({
    this.id,
    this.title,
    this.source,
    this.sourceLink,
    this.isPublished,
    this.commentsCount,
    this.likeCount,
    this.videoLength,
    this.summary,
    this.cover,
    this.origSource,
    this.shareUrl,
    this.likesCount,
    this.isLiked,
  });

  factory VideoModel.fromJSON(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      source: json['source'],
      sourceLink: json['source_link'],
      isPublished: json['is_published'],
      commentsCount: json['comments_count'],
      likeCount: json['like_count'],
      videoLength: json['video_length'],
      summary: json['summary'],
      cover: json['cover'],
      origSource: json['orig_source'],
      shareUrl: json['share_url'],
      likesCount: json['likes_count'],
      isLiked: json['is_liked'],
    );
  }
}
