import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_detail_model.dart';
// MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// 나중에 싱글톤으로 바꿀것
class UserRepository {
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response response = await dio.post("/sign-in", data: requestDTO.toJson());

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      responseDTO.data = new User.fromJson(responseDTO.data);

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
    //Logger().d("유저 리파지토리 진입");
    try {
      Response response = await dio.get("/user/my-profile-detail/3");
      // options: Options(headers: {"Authorization": "$jwt"});
      //Logger().d("페이지 통신 완료 : ${response.data}");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //Logger().d("타입 변경 완료 : ${responseDTO.data}");

      ProfileDetailModel model = ProfileDetailModel.fromJson(responseDTO.data);
      //Logger().d("파싱 완료 : ${model}");

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      // return ResponseDTO(success: false, data: null, errorType: null);
      return ResponseDTO(success: false);
    }
  }

}
