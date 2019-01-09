class CarouselModel {
  final int id;
  final String title;
  final String summary;
  final String cover;
  final String schemeUrl;
  final String actionType;
  final int weight;
  final String createdAt;

  CarouselModel({
    this.id,
    this.title,
    this.summary,
    this.cover,
    this.schemeUrl,
    this.actionType,
    this.weight,
    this.createdAt,
  });

  factory CarouselModel.fromJSON(Map<String, dynamic> json) {
    return CarouselModel(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      cover: json['cover'],
      schemeUrl: json['scheme_url'],
      actionType: json['action_type'],
      weight: json['weight'],
      createdAt: json['created_at'],
    );
  }
}
