
class AuthorModel {
  final bool isVerified;
  final String createDate;
  final int id;
  final String name;
  final int sentencesCount;
  final bool isLocked;
  final String forbidDate;
  final String description;
  final String type;
  final String coverUrl;

  AuthorModel({
    this.isVerified,
    this.createDate,
    this.id,
    this.name,
    this.sentencesCount,
    this.isLocked,
    this.forbidDate,
    this.description,
    this.type,
    this.coverUrl
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      isVerified: json['is_verified'] as bool,
      createDate: json['created_at'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      sentencesCount: json['sentences_count'] as int,
      isLocked: json['is_locked'] as bool,
      forbidDate: json['forbided_at'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      coverUrl: json['cover'] as String
    );
  }
}