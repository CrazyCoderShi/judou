import 'author_model.dart';
import 'image_data.dart';
import 'user_model.dart';

class JuDouModel {
  final bool isPrivate;
  final String dailyDate;
  final String publishedDate;
  final bool isAd;
  final bool isUsedByWechat;
  final bool isEditable;
  final AuthorModel author;
  final bool isOriginal;
  final UserModel user;
  final ImageModel image;
  final bool isCollected;
  final double likeCount;
  final bool isUsedByWeibo;
  final String shareUrl;
  final String maskColor;
  final List<ImageModel> pictures;
  final bool isLiked;
  final bool isRandomable;
  final String content;
  final int commentCount;
  final bool isDisabledComment;
  final String maskTransparent;
  final String weiboUsedAt;
  final String uuid;
  final String subHeading;
  final bool isUgc;

  JuDouModel(
      {this.isPrivate,
      this.dailyDate,
      this.publishedDate,
      this.isAd,
      this.isUsedByWechat,
      this.isEditable,
      this.author,
      this.isOriginal,
      this.user,
      this.image,
      this.isCollected,
      this.likeCount,
      this.isUsedByWeibo,
      this.shareUrl,
      this.maskColor,
      this.pictures,
      this.isLiked,
      this.isRandomable,
      this.content,
      this.commentCount,
      this.isDisabledComment,
      this.maskTransparent,
      this.weiboUsedAt,
      this.uuid,
      this.subHeading,
      this.isUgc});

  factory JuDouModel.fromJson(Map<String, dynamic> json) {
    return JuDouModel(
        isPrivate: json['is_private'],
        dailyDate: json['daily_date'],
        publishedDate: json['published_at'],
        isAd: json['is_ad'],
        isUsedByWechat: json['is_used_by_wechat'],
        isEditable: json['is_editable'],
        author: json['author'],
        isOriginal: json['is_original'],
        user: json['user'],
        image: json['image'],
        isCollected: json['is_collected'],
        likeCount: json['like_count'],
        isUsedByWeibo: json['is_used_by_weibo'],
        shareUrl: json['share_url'],
        maskColor: json['mask_color'],
        pictures: json['pictures'],
        isLiked: json['is_liked'],
        isRandomable: json['is_randomable'],
        content: json['content'],
        commentCount: json['comment_count'],
        isDisabledComment: json['is_disabled_comment'],
        maskTransparent: json['mask_transparent'],
        weiboUsedAt: json['weibo_used_at'],
        uuid: json['uuid'],
        subHeading: json['subheading'],
        isUgc: json['is_ugc']);
  }
}
