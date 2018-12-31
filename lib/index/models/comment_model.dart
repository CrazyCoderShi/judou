import 'user_model.dart';

class CommentModel {
  final bool isSelf;
  final int upCount;
  final int id;
  final String content;
  final String threadId;
  final bool isLiked;
  final String commentableType;
  final UserModel user;
  final Map<String, dynamic> replyToComment;
  final bool isBlock;
  final String commentableId;
  final String createdAt;

  CommentModel({
    this.isSelf,
    this.upCount,
    this.id,
    this.content,
    this.threadId,
    this.isLiked,
    this.commentableType,
    this.user,
    this.replyToComment,
    this.isBlock,
    this.commentableId,
    this.createdAt,
  });

  factory CommentModel.fromJSON(Map<String, dynamic> json) {
    return CommentModel(
      isSelf: json['is_self'],
      upCount: json['up_count'],
      id: json['id'],
      content: json['content'],
      threadId: json['thread_id'],
      isLiked: json['is_liked'],
      commentableType: json['commentable_type'],
      user: UserModel.fromJson(json['user'] ?? Map()),
      replyToComment: json['reply_to_comment'] ?? Map<String, dynamic>(),
      isBlock: json['is_block'],
      commentableId: json['commentable_id'],
      createdAt: json['created_at'],
    );
  }
}
