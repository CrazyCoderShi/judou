class TopicModel {
  final String schemeUrl;
  final String name;
  final String uuid;
  final String cover;
  final String description;

  TopicModel({
    this.schemeUrl,
    this.name,
    this.uuid,
    this.cover,
    this.description,
  });

  factory TopicModel.fromJSON(Map<String, dynamic> json) {
    return TopicModel(
      schemeUrl: json['scheme_url'] as String,
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      cover: json['cover'] as String,
      description: json['description'] as String,
    );
  }
}
