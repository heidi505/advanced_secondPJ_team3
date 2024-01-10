import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

import '../model/user_mock.dart';

//1. 창고 데이터
class SessionUser {
  //화면 context에 접근하는 법. 글로벌 키
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;

  SessionUser({
    this.user,
    this.jwt
  });

  Future<void> login(LoginReqDTO loginReqDTO) async {
    //1. 통신코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    //2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값 갱신
      this.user = responseDTO.data as User;
      this.jwt = responseDTO.token;


      // print("성공");
      // 3. 페이지 이동
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainPage, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("${responseDTO.errorType!.message!}")));
    }
  }
}
  //3. 창고 관리자
final sessionProvider = Provider<SessionUser>((ref){
  return SessionUser();
});