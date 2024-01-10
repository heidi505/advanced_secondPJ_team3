import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_model.dart';

class UserRepository {

  Future<ResponseDTO> fetchUserInfo() async {
    Logger().d("유저레파지토리 진입");

    try {
      Response response = await dio.get("/user/my-profile-detail/1");
       //   options: Options(headers: {"Authorization": "$jwt"})
      Logger().d("페이지 통신 완료 : ${response.data}");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("타입 변경 완료 : ${responseDTO.data}");


      ProfileModel model = ProfileModel.fromJson(responseDTO.data);
      Logger().d("파싱완료 ${model}");

      responseDTO.data = model;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, data: null, errorType: e.toString());
    }
  }
}
