import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
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

  SessionUser({this.user, this.jwt});

  Future<void> login(LoginReqDTO loginReqDTO) async {
    Logger().d("++프로바이더까지 들어옴++" + loginReqDTO.email!);
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

  Future<void> join(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    Logger().d(" join 요청 확인");
    Logger().d("응답 responseDTO : " + responseDTO.success.toString());
    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.joinProfilePage);
      Logger().d(" join 요청 확인22");
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }

  // Future<void> profileJoin(JoinReqDTO joinReqDTO) async {
  //   // 1. 통신 코드
  //   ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
  //
  //   // 2. 비지니스 로직
  //   if (responseDTO.success == true) {
  //     Navigator.pushNamed(mContext!, Move.joinWelcomePage);
  //   } else {
  //     ScaffoldMessenger.of(mContext!).showSnackBar(
  //       SnackBar(
  //         content: Text(responseDTO.errorType!.message!),
  //       ),
  //     );
  //   }
  // }

  Future<void> mailSend(MailSendDTO mailSendDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchMailSend(mailSendDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }

  Future<void> mailCheck(MailCheckDTO mailCheckDTO) async {
    Logger().d("여기까지 실행됨33");
    // 1. 통신 코드
    ResponseDTO responseDTO =
        await UserRepository().fetchMailCheck(mailCheckDTO);
    Logger().d("여기까지 실행됨13344");
    Logger().d("${responseDTO.success} 야 진짜 집에 가자");

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Logger().d("${responseDTO.success} 야 진짜 집에 보내줘");
      Navigator.pushNamed(mContext!, Move.joinPasswordPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }
}

//3. 창고 관리자
final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});
