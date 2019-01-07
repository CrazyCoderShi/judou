class TagModel {
  final String name;
  final int id;
  final String cover;
  final String summary;
  final int weight;
  final bool isCloseable;
  final String publishedAt;

  TagModel({
    this.name,
    this.id,
    this.cover,
    this.summary,
    this.weight,
    this.isCloseable,
    this.publishedAt,
  });

  factory TagModel.fromJSON(Map<String, dynamic> json) {
    return TagModel(name: json['name'], id: json['id']);
  }
}
