import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';

class FavoriteFriendRequestDTO {
  int? userId;
  bool? isFavorite;

  FavoriteFriendRequestDTO({
    this.userId,
    this.isFavorite,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "favorite": isFavorite,
    };
  }
}
