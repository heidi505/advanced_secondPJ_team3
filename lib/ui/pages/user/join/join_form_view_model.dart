// 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinFormModel {
  String email;
  String nickname;
  String password;
  String phoneNum;
  DateTime birthdate;
  int verifyNumber;

  JoinFormModel({
    required this.verifyNumber,
    required this.email,
    required this.nickname,
    required this.password,
    required this.phoneNum,
    required this.birthdate,
  });

  @override
  String toString() {
    return 'JoinFormModel{userId: $email, userPassword: $nickname, userConfirmPassword: $password, username: $phoneNum, userEmail: $birthdate';
  }

  JoinFormModel copyWith({
    int? verifyNumber,
    String? email,
    String? nickname,
    String? password,
    String? phoneNum,
    DateTime? birthdate,
  }) {
    return JoinFormModel(
      verifyNumber: verifyNumber ?? this.verifyNumber,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      phoneNum: phoneNum ?? this.phoneNum,
      birthdate: birthdate ?? this.birthdate,
    );
  }
}

// 창고
class JoinFormViewModel extends StateNotifier<JoinFormModel> {
  JoinFormViewModel(super.state);

  void setVerifyNumber(int value) {
    state = state.copyWith(verifyNumber: value);
  }

  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setNickName(String value) {
    state = state.copyWith(nickname: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setPhoneNum(String value) {
    state = state.copyWith(phoneNum: value);
  }

  void setBirthDate(DateTime value) {
    state = state.copyWith(birthdate: value);
  }
}

final joinFormProvider =
    StateNotifierProvider.autoDispose<JoinFormViewModel, JoinFormModel?>((ref) {
  return JoinFormViewModel(
    JoinFormModel(
      verifyNumber: 0,
      email: "",
      nickname: "",
      password: "",
      phoneNum: "",
      birthdate: DateTime.now(),
    ),
  );
});
