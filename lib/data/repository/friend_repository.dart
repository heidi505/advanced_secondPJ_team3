import 'dart:core';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_request_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';

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
      FavoriteFriendRequestDTO favoriteFriendRequestDTO, String jwt) async {
    print("isFavorite 타입: ${favoriteFriendRequestDTO.isFavorite.runtimeType}");

    // try {
      Response<dynamic> response = await dio.put(
          "/friends/favorite/${favoriteFriendRequestDTO.userId}",
          options: Options(headers: {"Authorization": jwt}),
          data: favoriteFriendRequestDTO.toJson(),
          );
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = new FavoriteFriendResponseDTO.fromJson(responseDTO.data);

      return responseDTO;
    // } catch (e) {
    //   logger.e("Error in fetchFavoriteStatus: $e");
    //   return ResponseDTO(
    //       success: false,
    //       errorType:
    //           ErrorType(message: "Error in fetchFavoriteStatus", status: 500));
    //   return ResponseDTO(success: false);
    // }
  }

  Future<ResponseDTO> fetchSearchingFriend(String phoneNumForSearch, String jwt) async {
    Response response = await dio.get("/user/search-user/$phoneNumForSearch", options: Options(headers: {"Authorization" : jwt}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(responseDTO.data);
    responseDTO.data = ProfileDetailResponseDTO.fromJson(responseDTO.data);
    Logger().d(responseDTO.data);

    return responseDTO;

  }
}
