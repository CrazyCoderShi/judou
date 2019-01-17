/** 
 * {
		"id": 252270,
		"name": "教徒收藏夹",
		"is_default": false,
		"is_self": false,
		"type": "collection",
		"description": "教徒收藏夹",
		"sentences_count": "",
		"cover": "http:\/\/judou.b0.upaiyun.com\/image\/collection\/2019\/01\/03\/qnyssjc6gddkvgu7klff2h2ps5rfkx08.jpg"
	}
 * 
*/

class CollectionModel {
  final int id;
  final String name;
  final bool isDefault;
  final bool isSelf;
  final String type;
  final String description;
  final String sentencesCount;
  final String cover;

  CollectionModel({
    this.id,
    this.name,
    this.isDefault,
    this.isSelf,
    this.type,
    this.description,
    this.sentencesCount,
    this.cover,
  });

  factory CollectionModel.fromJSON(Map<String, dynamic> json) {
    return CollectionModel(
        id: json['id'],
        name: json['name'],
        isDefault: json['is_default'],
        isSelf: json['is_self'],
        type: json['type'],
        description: json['description'],
        sentencesCount: json['sentences_count'],
        cover: json['cover']);
  }
}
