
class ImageModel {
  final String url;
  final String copyRight;
  final String color;
  final String id;

  ImageModel({this.url, this.copyRight, this.color, this.id});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['url'] as String,
      copyRight: json['copyright'] as String,
      color: json['color'] as String,
      id: json['id'] as String
    );
  }
}