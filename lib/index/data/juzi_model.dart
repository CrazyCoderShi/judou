import 'author_model.dart';
import 'image_data.dart';
import 'user_model.dart';

class JuDouModel {
  final bool isPrivate;
  final String dailyDate;
  final String day;
  final String publishedDate;
  final bool isAd;
  final bool isUsedByWechat;
  final bool isEditable;
  final AuthorModel author;
  final bool isOriginal;
  final UserModel user;
  final ImageModel image;
  final bool isCollected;
  final int likeCount;
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
        this.day,
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
    var list = json['pictures'] as List;
    List<ImageModel> imageList;
    if (list != null) {
      imageList =list.map((i) => ImageModel.fromJson(i)).toList();
    }

    // 日期转换
    String dailyString = json['daily_date'].toString().substring(0, 7).replaceAll(RegExp(r'-'), '.');
    var date = DateTime.parse(json['daily_date']);
    var dayList = ['一', '二', '三', '四', '五', '六', '日'];
    var weekday = dayList[date.weekday-1];
    String dayString = '$date'.substring(8, 10);

    return JuDouModel(
        isPrivate: json['is_private'] as bool,
        dailyDate: dailyString + '星期' + '$weekday',
        day: dayString,
        publishedDate: json['published_at'] as String,
        isAd: json['is_ad'] as bool,
        isUsedByWechat: json['is_used_by_wechat'] as bool,
        isEditable: json['is_editable'] as bool,
        author: AuthorModel.fromJson(json['author'] ?? Map()),
        isOriginal: json['is_original'] as bool,
        user: UserModel.fromJson(json['user'] ?? Map()),
        image: ImageModel.fromJson(json['image'] ?? Map()),
        isCollected: json['is_collected'] as bool,
        likeCount: json['like_count'] as int,
        isUsedByWeibo: json['is_used_by_weibo'] as bool,
        shareUrl: json['share_url'] as String,
        maskColor: json['mask_color'] as String,
        pictures: imageList,
        isLiked: json['is_liked'] as bool,
        isRandomable: json['is_randomable'] as bool,
        content: json['content'] as String,
        commentCount: json['comment_count'] as int,
        isDisabledComment: json['is_disabled_comment'] as bool,
        maskTransparent: json['mask_transparent'] as String,
        weiboUsedAt: json['weibo_used_at'] as String,
        uuid: json['uuid'] as String,
        subHeading: json['subheading'] as String,
        isUgc: json['is_ugc'] as bool);
  }
}
