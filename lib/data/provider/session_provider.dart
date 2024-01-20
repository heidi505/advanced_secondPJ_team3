import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

import '../../ui/pages/my_info/my_info_page.dart';
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

      Logger().d("-----세션 값 확인");
      Logger().d(user.toString() + "확인중" + jwt!);
      // print("성공");
      // 3. 페이지 이동
      // Navigator.pushNamedAndRemoveUntil(
      //     mContext!, Move.mainPage, (route) => false);
      Navigator.pushNamed(mContext!, Move.mainPage);
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

  Future<void> finalJoin(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    Logger().d(" finaljoin 요청 확인");
    Logger().d("응답 responseDTO : " + responseDTO.success.toString());
    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.joinWelcomePage);
      Logger().d(" join 요청 확인22");
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }

  Future<void> profileUpdate(
      ProfileUpdateRequestDTO profileUpdateRequestDTO, String jwt) async {
    // 1. 통신 코드
    ResponseDTO responseDTO =
        await UserRepository().fetchProfileUpdate(profileUpdateRequestDTO, jwt);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Logger().d("통신 성공");
      Navigator.popAndPushNamed(mContext!, Move.profilePage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }

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

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.joinPasswordPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.errorType!.message!),
        ),
      );
    }
  }

  Future<void> newPhoneNum(
      PhoneNumUpdateDTO phoneNumUpdateDTO, String jwt) async {
    Logger().d("+++phoneNum 여기서 통신 시작 +++");
    // 1. 통신 코드
    ResponseDTO responseDTO =
        await UserRepository().fetchPhoneNumUpdate(phoneNumUpdateDTO, jwt);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.myInfoPage);
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
