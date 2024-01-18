import 'dart:core';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';

import '../../_core/constants/http.dart';
import '../dto/response_dto.dart';

class FriendRepository {
  final logger = Logger();

  Future<ResponseDTO> notifyMain(int userId, String jwt) async {
    Logger().d("메인 통신 중 - 레파지토리까지 들어옴 $userId");
    Response response = await dio.get("/user/friend-tep-main/$userId",
        options: Options(headers: {"Authorization": "$jwt"}));

    Logger().d("메인 통신 중 ${response.data}");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    MainDTO mainDTO = MainDTO.fromJson(responseDTO.data);

    responseDTO.data = mainDTO;

    return responseDTO;
  }

  Future<ResponseDTO> fetchFavoriteStatus(
      FavoriteFriendDTO favoriteFriendDTO, String jwt) async {
    print("유저아이디 스트링? 숫자?");
    print(favoriteFriendDTO.userId);
    print(favoriteFriendDTO.isFavorite);
    print("기마얀을 찾아라!!");
    print(favoriteFriendDTO.toJson());
    print("isFavorite 타입: ${favoriteFriendDTO.isFavorite.runtimeType}");

    try {
      Response<dynamic> response = await dio.put(
          "/friends/favorite/${favoriteFriendDTO.userId}",
          options: Options(headers: {"Authorization": jwt}),
          data: favoriteFriendDTO.toJson(),
          );
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      logger.d("패치페이브릿스테이터스");
      logger.d(responseDTO.data);

      return responseDTO;
    } catch (e) {
      logger.e("Error in fetchFavoriteStatus: $e");
      return ResponseDTO(
          success: false,
          errorType:
              ErrorType(message: "Error in fetchFavoriteStatus", status: 500));
      // return ResponseDTO(success: false);
    }
  }
}
