import 'package:intl/intl.dart';

class JoinReqDTO {
  final String? email;
  final String? nickname;
  final String? password;
  final String? phoneNum;
  final DateTime? birthdate;

  JoinReqDTO({
    this.email,
    this.nickname,
    this.password,
    this.phoneNum,
    this.birthdate,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "nickname": nickname,
        "password": password,
        "phoneNum": phoneNum,
        "birthdate": DateFormat('yyyy-MM-dd').format(birthdate!),
      };

// request에만 쓰니까 fromJson은 필요없다
}

class LoginReqDTO {
  final String? email;
  final String? password;

  LoginReqDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email!, "password": password!};
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

class PasswordDTO {
  final String password;

  PasswordDTO({required this.password});

  Map<String, dynamic> toJson() => {"password": password};
}

class FindPasswordDTO{
  final String email;

  FindPasswordDTO({required this.email});

  Map<String, dynamic> toJson() => {"email": email};
}

class PhoneNumUpdateDTO{
  final String phoneNum;

  PhoneNumUpdateDTO({required this.phoneNum});

  Map<String, dynamic> toJson() => {"phoneNum": phoneNum};
}
