class User {
  int id;
  String? email;
  String? phoneNum;
  String password;


  User({
    required this.id,
    required this.email,
    required this.phoneNum,
    required this.password,
  });



  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "email": email,
        "phoneNum": phoneNum,
        "password": password,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        phoneNum = json["phoneNum"],
  password = json["password"];
}



   