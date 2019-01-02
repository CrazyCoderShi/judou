class TabModel {
  final int id;
  final String name;

  TabModel({this.id, this.name});

  factory TabModel.fromJSON(Map<String, dynamic> json) {
    return TabModel(id: json['id'] as int, name: json['name'] as String);
  }
}
