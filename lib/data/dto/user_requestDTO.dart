class JoinReqDTO {
  final String email;
  final String nickname;
  final String password;
  final String phoneNum;
  final String birthdate;

  JoinReqDTO({
    required this.email,
    required this.nickname,
    required this.password,
    required this.phoneNum,
    required this.birthdate,

  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "nickname": nickname,
    "password": password,
    "phoneNum": phoneNum,
    "birthdate": birthdate,
  };

// request에만 쓰니까 fromJson은 필요없다
}

class LoginReqDTO {
  final String? email;
  final String? password;

  LoginReqDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
