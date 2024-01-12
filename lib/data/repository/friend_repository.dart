import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';

import '../../_core/constants/http.dart';
import '../dto/response_dto.dart';

class FriendRepository{

  Future<ResponseDTO> notifyMain(int userId, String jwt) async{
    Logger().d("메인 통신 중 - 레파지토리까지 들어옴 $userId");
    Response response = await dio.get("/user/friend-tep-main/$userId", options: Options(headers: {"Authorization":"$jwt"}));

    Logger().d("메인 통신 중 ${response.data}");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    MainDTO mainDTO = MainDTO.fromJson(responseDTO.data);

    responseDTO.data = mainDTO;

    return responseDTO;
  }

}