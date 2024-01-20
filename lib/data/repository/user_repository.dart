import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/email_friend_add_request_dto.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/email_friend_add_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/phoneNum_friend_add_request_dto.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/phoneNum_friend_add_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_backImage_delete_response_dto/profile_backimage_delete_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_image_delete_response_dto/profile_image_delete_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_dto/phone_num_response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/friends/friends_search_page.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_detail_model.dart';

import '../dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import '../model/profile_detail_model.dart';
import '../provider/profile_detail_provider.dart';

// MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// 나중에 싱글톤으로 바꿀것
class UserRepository {
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response response = await dio.post(
        "/sign-in",
        data: requestDTO.toJson(),
      );
      Logger().d(response.data);

      Logger().d("++로그인 요청++");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.data = User.fromJson(responseDTO.data);
      Logger().d(responseDTO.data);

      List<String>? jwt = response.headers["Authorization"];

      if (jwt != null) {
        responseDTO.token = jwt.first; // jwt[0]과 같음
      }

      // 필요할때만 쓰기
      // responseDTO.data = User.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return new ResponseDTO(success: false);
    }
  }

  //  회원가입
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      Logger().d(requestDTO.email! + "여기" + requestDTO.password!);
      Response<dynamic> response =
          await dio.post("/sign-up", data: requestDTO.toJson());
      Logger().d("요청완료됨111");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("요청완료됨222");
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchMailSend(MailSendDTO requestDTO) async {
    try {
      Response<dynamic> response =
          await dio.post("/mail-send", data: requestDTO.toJson());
      Logger().d("요청완료됨111" + "mail_send");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchMailCheck(MailCheckDTO requestDTO) async {
    try {
      Response<dynamic> response =
          await dio.post("/mail-check", data: requestDTO.toJson());
      Logger().d("요청완료됨1ss1");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("요청완료됨1ss1" + "ddddd");
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchPasswordCheck(
      FindPasswordDTO findPasswordDTO) async {
    try {
      Response<dynamic> response =
          await dio.post("/password-find", data: findPasswordDTO.toJson());
      Logger().d("111.+++이메일 요청이요+++");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("222. ???이메일 요청이요???");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

  // 200이 아니면 catch로 감

  // 프로필 상세보기
  Future<ResponseDTO> fetchProfileDetail(int? id, String jwt) async {
    Logger().d("유저 리파지토리 진입");
    try {
      // 서버에 요청
      Response response = await dio.get("/user/my-profile-detail/$id",
          options: Options(headers: {"Authorization": jwt}));
      Logger().d("페이지 통신 완료 : ${response.data}");

      // 서버에서 받아온 값을 Dart 객체로 변환
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("타입 변경 완료 : ${responseDTO.data}");

      // 필요한 유저 정보만 추출해서 덮어 씌우기
      responseDTO.data = ProfileDetailResponseDTO.fromJson(responseDTO.data);
      Logger().d("파싱 완료 : ${responseDTO.data.toString()}");

      return responseDTO;
    } catch (e) {
      // return ResponseDTO(success: false, data: null, errorType: null);
      return ResponseDTO(success: false);
    }
  }

  // 프로필 수정

  Future<ResponseDTO> fetchProfileUpdate(
      ProfileUpdateRequestDTO profileUpdateRequestDTO, String jwt) async {
    Logger().d("업데이트 레파지토리 진입 확인(닉네임) : ${profileUpdateRequestDTO.nickname}");
    Logger().d(
        "업데이트 레파지토리 진입 확인(상태메세지) : ${profileUpdateRequestDTO.statusMessage}");

    try {
      // DTO의 값을 컨트롤러로 요청을 보내고 Response 객체에 담는다.

      Response response = await dio.post("/user/my-profile-update",
          data: profileUpdateRequestDTO.toJson(),
          options: Options(headers: {"Authorization": jwt}));

      // response.data의 값을 Dart객체로 변환 작업
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      Logger().d("${responseDTO.data} 1번 파싱 안됨");
      // 수정한 정보만 추출해서 덮어 씌우기

      responseDTO.data =
          new ProfileUpdateResponseDTO.fromJson(responseDTO.data);
      Logger().d("${responseDTO.data} 2번 파싱 안됨");

      // responseDTO.data =
      //   new ProfileDetailResponseDTO.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      Logger().d("캐치 탐 ${e.toString()}");
      return ResponseDTO(success: false);
    }
  }

// 프로필 삭제(프로필 이미지)
  Future<ResponseDTO> fetchProfileImageDelete() async {
    try {
      Response response = await dio.get("/user/my-profileImage-delete/{id}");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data =
          new ProfileImageDeleteResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

// 프로필 삭제(배경 이미지)
  Future<ResponseDTO> fetchProfileBackImageDelete() async {
    try {
      Response response =
          await dio.get("/user/my-profileBackImage-delete/{id}");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data =
          new ProfileBackImageDeleteResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

// 연락처로 친구 추가
  Future<ResponseDTO> fetchPhoneNumFriendAdd(
      PhoneNumFriendAddRequestDTO phoneNumFriendAddRequestDTO) async {
    try {
      Response response = await dio.post("/user/phoneNum-friend-add",
          data: phoneNumFriendAddRequestDTO.toJson());
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data =
          PhoneNumFriendAddResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

// 이메일로 친구 추가
  Future<ResponseDTO> fetchEmailFriendAdd(
      EmailFrinedAddRequestDTO emailFrinedAddRequestDTO) async {
    try {
      Response response = await dio.post("/user/emil-friend-add",
          data: emailFrinedAddRequestDTO.toJson());
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = EmailFriendAddResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

// 내 정보 전화번호 수정
  Future<ResponseDTO> fetchPhoneNumUpdate(
      PhoneNumUpdateDTO phoneNumUpdateDTO, String jwt) async {
    try {
      // DTO의 값을 컨트롤러로 요청을 보내고 Response 객체에 담는다.
      Response response = await dio.post("/user/update",
          data: phoneNumUpdateDTO.toJson(),
          options: Options(headers: {"Authorization": jwt}));
      // response.data의 값을 Dart객체로 변환 작업
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      // 수정한 정보만 추출해서 덮어 씌우기
      Logger().d(responseDTO);
      Logger().d(responseDTO.data);
      PhoneNumResponseDTO dto = PhoneNumResponseDTO.fromJson(responseDTO.data);
      responseDTO.data = dto;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

  // 친구 검색
  Future<ResponseDTO> fetchFriendSearch(String keyword, String jwt) async {
    Logger().d("키워드 들어옵니까? : ${keyword}");
    try {
      Response response = await dio.get("/user/search-friend",
          queryParameters: {"keyword": keyword},
          options: Options(headers: {"Authorization": jwt}));
      Logger().d("페이지 통신 완료 : ${response.data}");

      // 서버에서 받아온 값을 Dart 객체로 변환
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("타입 변경 완료 : ${responseDTO.data}");

      List<FriendSearchResponseDTO> mapList =
          (responseDTO.data as List<dynamic>)
              .map((e) => FriendSearchResponseDTO.fromJson(e))
              .toList();
      // 필요한 유저 정보만 추출해서 덮어 씌우기
      responseDTO.data = mapList;
      Logger().d("파싱 완료 : ${responseDTO.data.toString()}");

      return responseDTO;
    } catch (e) {
      Logger().d(e.toString());
      return ResponseDTO(success: false);
    }
  }
}
