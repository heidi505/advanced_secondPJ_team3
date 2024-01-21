class User {
  int? id;
  String? nickname;
  String? email;
  String? phoneNum;
  String? jwt;
  String? profileImage;
  String? backImage;
  String? statusMessage;

  User(
      {this.id,
      this.email,
      this.phoneNum,
      this.nickname,
      this.jwt,
      this.backImage,
      this.profileImage,
      this.statusMessage});

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "phoneNum": phoneNum,
        "jwt": jwt,
        "profileImage": profileImage,
        "backImage": backImage,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nickname = json["nickname"],
        email = json["email"],
        phoneNum = json["phoneNum"],
        jwt = json["jwt"],
        profileImage = json["profileImage"],
        backImage = json["backImage"],
        statusMessage = json["statusMessage"];

  @override
  String toString() {
    return 'User{id: $id, nickname: $nickname, email: $email, phoneNum: $phoneNum, jwt: $jwt, profileImage: $profileImage, backImage : $backImage}';
  }
}
