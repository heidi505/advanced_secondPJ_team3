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
  String? fcmToken;
  final String? email;
  final String? password;

  LoginReqDTO({required this.email, required this.password, this.fcmToken});

  Map<String, dynamic> toJson() => {"email": email, "password": password, "fcmToken":fcmToken};
}

class MailSendDTO {
  final String email;

  MailSendDTO({required this.email});

  Map<String, dynamic> toJson() => {"email": email};
}

class MailCheckDTO {
  final int verifyNumber;

  MailCheckDTO({required this.verifyNumber});

  Map<String, dynamic> toJson() => {"verifyNumber": verifyNumber};
}
