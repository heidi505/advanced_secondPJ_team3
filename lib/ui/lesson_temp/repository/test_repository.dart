

import 'package:dio/dio.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/ui/lesson_temp/dto/req_dto.dart';
import 'package:team3_kakao/ui/lesson_temp/dto/resp_dto.dart';

import '../../../_core/constants/http.dart';
import '../../../data/dto/response_dto.dart';

class TestRepository{

  Future<ResponseDTO> notifyuserId(ReqDTO reqDTO) async{ //뷰모델에서 받은 ReqDTO

    //toJson 으로 요청을 보내고 나면 => Response라는 객체 안에 헤더랑 바디가 있는 거임. reponse.data가 바디
    Response response = await dio.post("/userTest", data: reqDTO.toJson());

    //공통DTO를 다트 객체로 바꾸어주는 작업. 현재 response.data의 객체는 맵이고, fromJson의 결과로 반환하는 애가 다트 객체
    ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

    //우리가 원하는 데이터를 다트 객체로 바꾸어주는 작업
    //그다음 responseDTO.data에 덧씌워주고, responseDTO를 반환
    responseDTO.data = new RespDTO.fromJson(responseDTO.data);

    return responseDTO;

  }
  
  Future<ResponseDTO> notifyUserList() async{
    Response response = await dio.get("/ListTest");

    ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

    List<dynamic> mapList = responseDTO.data as List<dynamic>;

    List<RespDTO> dtoList = mapList.map((e) => RespDTO.fromJson(e)).toList();

    responseDTO.data = dtoList;

    return responseDTO;
  }
}