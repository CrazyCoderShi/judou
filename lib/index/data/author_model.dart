
class AuthorModel {
  final bool isVerified;
  final String createDate;
  final String id;
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
      isVerified: json['is_verified'],
      createDate: json['created_at'],
      id: json['id'],
      name: json['name'],
      sentencesCount: json['sentences_count'],
      isLocked: json['is_locked'],
      forbidDate: json['forbided_at'],
      description: json['description'],
      type: json['type'],
      coverUrl: json['cover']
    );
  }
}