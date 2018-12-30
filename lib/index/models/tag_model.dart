class TagModel {
  final String name;
  final int id;

  TagModel({this.name, this.id});

  factory TagModel.fromJSON(Map<String, dynamic> json) {
    return TagModel(name: json['name'], id: json['id']);
  }
}
