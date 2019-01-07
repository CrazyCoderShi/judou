class UserModel {
  final String nickname;
  final String avatar;
  final String uid;

  UserModel({this.nickname, this.avatar, this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        nickname: json['nickname'] as String,
        avatar: json['avatar'] as String,
        uid: '${json['uid']}');
  }
}
