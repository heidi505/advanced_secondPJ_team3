import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';

class FavoriteFriendResponseDTO {
  int? userId;
  bool? isFavorite;

  FavoriteFriendResponseDTO({
    this.userId,
    this.isFavorite,
  });

  FavoriteFriendResponseDTO.fromJson(Map<String, dynamic>? json)
      : userId = json?["userId"],
        isFavorite = json?["isFavorite"];
}
