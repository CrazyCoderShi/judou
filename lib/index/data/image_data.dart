
class ImageModel {
  final String url;
  final String copyRight;
  final String color;
  final String id;

  ImageModel({this.url, this.copyRight, this.color, this.id});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['url'],
      copyRight: json['copyright'],
      color: json['color'],
      id: json['id']
    );
  }
}