
class UserModel {
  final String nickname;
  final String avatar;
  final String uid;

  UserModel({this.nickname, this.avatar, this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nickname: json['nickname'],
      avatar: json['avatar'],
      uid: json['uid']
    );
  }
}