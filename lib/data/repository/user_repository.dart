import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_backImage_delete_response_dto/profile_backimage_delete_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_image_delete_response_dto/profile_image_delete_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_detail_model.dart';

import '../dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import '../model/profile_detail_model.dart';
import '../provider/profile_detail_provider.dart';
// MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// 나중에 싱글톤으로 바꿀것
class UserRepository {
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response response = await dio.post("/sign-in", data: requestDTO.toJson());
      Logger().d(response.data);

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

  // 프로필 상세보기
  Future<ResponseDTO> fetchProfileDetail() async {
    Logger().d("유저 리파지토리 진입");
    try {
      // 서버에 요청
      Response response = await dio.get("/user/my-profile-detail/2");
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
  Future<ResponseDTO> fetchProfileUpdate(ProfileUpdateRequestDTO profileUpdateRequestDTO) async{
    try{
      // DTO의 값을 컨트롤러로 요청을 보내고 Response 객체에 담는다.
      Response response = await dio.post("/user/my-profile-update", data:profileUpdateRequestDTO.toJson());
      // response.data의 값을 Dart객체로 변환 작업
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      // 수정한 정보만 추출해서 덮어 씌우기
      responseDTO.data = new ProfileDetailResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

  // 프로필 삭제(프로필 이미지)
  Future<ResponseDTO> fetchProfileImageDelete() async{
    try{
      Response response = await dio.get("/user/my-profileImage-delete/{id}");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = new ProfileImageDeleteResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }
  
  // 프로필 삭제(배경 이미지)
  Future<ResponseDTO> fetchProfileBackImageDelete() async{
    try {
      Response response = await dio.get("/user/my-profileBackImage-delete/{id}");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = new ProfileBackImageDeleteResponseDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false);
    }
  }

}
