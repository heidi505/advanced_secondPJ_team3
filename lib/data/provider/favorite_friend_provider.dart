import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';

 class FavoriteUpdateModel {
   FavoriteFriendDTO favoriteFriendDTO;

  FavoriteUpdateModel(this.favoriteFriendDTO);
 }

class FavoriteUpdateViewModel extends StateNotifier<FavoriteFriendDTO> {
  Ref ref;

  FavoriteUpdateViewModel(FavoriteFriendDTO _state, this.ref) : super(_state);

  Future<void> notifyInit(FavoriteFriendDTO favoriteFriendDTO) async {
    ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);
    ResponseDTO responseDTO = await FriendRepository()
        .fetchFavoriteStatus(favoriteFriendDTO, session.user!.jwt!);

    print("Favorite Status Updated: ${favoriteFriendDTO.isFavorite}");

  }

  Future<void> updateFavoriteStatus(
      FavoriteFriendDTO favoriteFriendDTO, String jwt) async {
    print("진입 체크");
    // 친구의 현재 즐겨찾기 상태를 확인하고 반전
    print("반전하기전");
    print(favoriteFriendDTO.isFavorite);
    bool newStatus = !(favoriteFriendDTO.isFavorite ?? false);
    print("반전!");
    print(newStatus);
    print(jwt);

    // 서버에 변경된 즐겨찾기 상태를 업데이트 요청
    ResponseDTO updateResponse = await FriendRepository().fetchFavoriteStatus(
      FavoriteFriendDTO(
        userId: favoriteFriendDTO.userId,
        isFavorite: newStatus,
      ),
      jwt,
    );

    print("서버 응답: $updateResponse");
    print("서버 응답: ${updateResponse.toString()}");

    print("입력된 값 뭐야?");
    print(favoriteFriendDTO.isFavorite);

    // 서버 응답 확인 후 로직 처리
    if (updateResponse.success == true) {
      // 성공적으로 업데이트된 경우, 파라미터로 받은 객체에 변경된 값을 할당
      favoriteFriendDTO.isFavorite = newStatus;

      // 디버깅용 메시지
      print("Favorite Status Updated: ${favoriteFriendDTO.isFavorite}");
    } else {
      // 실패 시 처리
    }
  }
}

final favoriteUpdateProvider =
    StateNotifierProvider<FavoriteUpdateViewModel, FavoriteFriendDTO>((ref) {
  FavoriteFriendDTO favoriteFriendDTO = new FavoriteFriendDTO();
  print("프로바~~~~~~이더");
  print(favoriteFriendDTO.isFavorite);
  return FavoriteUpdateViewModel(favoriteFriendDTO, ref)
    ..notifyInit(favoriteFriendDTO);
});
