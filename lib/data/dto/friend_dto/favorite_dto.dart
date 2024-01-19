import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';

class FavoriteFriendDTO {
  int? userId;
  bool? isFavorite;

  FavoriteFriendDTO({
    this.userId,
    this.isFavorite,
  });
  //
  // // Factory 메서드를 이용하여 FriendsDTO를 FavoriteFriendDTO로 변환
  // factory FavoriteFriendDTO.fromFriendsDTO(FriendsDTO friendsDTO) {
  //   return FavoriteFriendDTO(
  //     userId: friendsDTO.userId,
  //     isFavorite: friendsDTO.isFavorite,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "favorite": isFavorite,
    };
  }
}
