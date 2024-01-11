class User {
  int? id;
  String? nickname;
  String? email;
  String? phoneNum;
  String? password;
  String? jwt;

  User({this.id, this.email, this.phoneNum, this.nickname, this.jwt});

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNum": phoneNum,
        "password": password,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        phoneNum = json["phoneNum"],
        password = json["password"],
        nickname = json["nickname"],
        jwt = json["jwt"];
}
